require 'socket'

port = 2000

host = 'localhost'
path = '/index.html'

puts "Enter HTTP Method:"
request_method = gets.chomp

loop {
  if HTTP_METHODS.any? { |method| method == request_method }

    puts "Enter a URL:"
    host, root, path = gets.chomp.partition('/')
    path.prepend(root)

    request = "#{request_method} #{path} HTTP/1.0\r\n\r\n"

    socket = TCPSocket.open(host, port)
    socket.print(request)
    response = socket.read
    # split response at first blank line into headers and body
    headers, body = response.split("\r\n\r\n", 2)
    print body

  end 
}
