require 'sinatra'
require 'sinatra/reloader'

def cipher(phrase, shift)
  phrase = phrase.to_s if phrase.is_a?(String) == false
  puts "Shift should be an integer." if shift.is_a?(Integer) == false
  if shift.is_a?(Integer) == true
    code = ""
    phrase.each_char do |i|
      shift.times do
        i.next!
        i = "a" if i == "aa"
        i = "A" if i == "AA"
        i = " " if i == "!"
        i = "." if i == "/"
        i = "!" if i == "\""
        i = "(" if i == ")"
        i = ")" if i == "*"
      end
      code += i
    end
  end
  return code
end

get '/' do
  string = params["phrase"]
  num = params["shift"].to_i
  message = "Th "cipher(string, num)
  erb :index, :locals => {:message => message}
end
