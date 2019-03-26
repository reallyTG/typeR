library(streamR)


### Name: sampleStream
### Title: Connect to Twitter Streaming API and return a small random
###   sample of all public statuses.
### Aliases: sampleStream

### ** Examples

## Not run: 
##D ## capture a random sample of tweets
##D sampleStream( file.name="tweets_sample.json", user=FOO, password=BAR )
##D 
##D ## An example of an authenticated request using the ROAuth package, 
##D ## where consumerkey and consumer secret are fictitious. 
##D ## You can obtain your own at dev.twitter.com
##D  library(ROAuth)
##D  reqURL <- "https://api.twitter.com/oauth/request_token"
##D  accessURL <- "https://api.twitter.com/oauth/access_token"
##D  authURL <- "https://api.twitter.com/oauth/authorize"
##D  consumerKey <- "xxxxxyyyyyzzzzzz"
##D  consumerSecret <- "xxxxxxyyyyyzzzzzzz111111222222"
##D   my_oauth <- OAuthFactory$new(consumerKey=consumerKey,
##D     consumerSecret=consumerSecret, requestURL=requestURL,
##D     accessURL=accessURL, authURL=authURL)
##D  my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
##D 
##D ## Alternatively, it is also possible to create a token without the handshake:
##D  my_oauth <- list(consumer_key = "CONSUMER_KEY",
##D    consumer_secret = "CONSUMER_SECRET",
##D    access_token="ACCESS_TOKEN",
##D    access_token_secret = "ACCESS_TOKEN_SECRET")
##D 
##D  sampleStream( file.name="tweets_sample.json", oauth=my_oauth )
##D 
## End(Not run)




