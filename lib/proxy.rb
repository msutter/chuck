require 'proxy/server'

module Proxy
  def self.root
    @root ||= Pathname.new(__FILE__).dirname + '..'
  end

  def self.ssl_config
    {cert_chain_file: (root + 'certs/server.crt').to_s, private_key_file: (root + 'certs/server.key').to_s}
  end

  def self.log message
    puts "#{Time.now.strftime('%F %T')}, #{message}"
  end

  def self.log_error e, message
    log(message)
    $stderr.puts ["ERROR:", e.message, e.backtrace.take(20).join($/)].join($/)
  end
end