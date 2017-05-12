require 'faraday'

name = ARGV[0]
value = ARGV[1]

conn = Faraday.new(url: 'http://127.0.0.1:8080') do |f|
  f.response :logger
  f.adapter Faraday.default_adapter
end

conn.post do |req|
  req.url 'dv'
  req.headers['Content-Type'] = 'application/json'
  req.body =<<SSS
{ "name": "#{name}",
  "value": "#{value}" }
SSS

end
