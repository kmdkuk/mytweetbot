require 'twitter'
require 'dotenv'
Dotenv.load
class Tweet

  def initialize

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key =        ENV["CONSUMER_KEY"]
      config.consumer_secret =     ENV["CONSUMER_SECRET"]
      config.access_token =        ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
  end

  def tweet
    tweet = "test"
    update(tweet)
  end

  private

    def update(tweet)
      begin
        @client.update(tweet)
      rescue => e
        nil #TODO
      end
    end
end

if __FILE__ == $0
  Tweet.new.tweet
end
