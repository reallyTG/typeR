library(streamR)


### Name: filterStream
### Title: Connect to Twitter Streaming API and return public statuses that
###   match one or more filter predicates.
### Aliases: filterStream

### ** Examples

## Not run: 
##D  
##D ## An example of an authenticated request using the ROAuth package, 
##D ## where consumerkey and consumer secret are fictitious. 
##D ## You can obtain your own at dev.twitter.com
##D   library(ROAuth)
##D   requestURL <- "https://api.twitter.com/oauth/request_token"
##D   accessURL <- "https://api.twitter.com/oauth/access_token"
##D   authURL <- "https://api.twitter.com/oauth/authorize"
##D   consumerKey <- "xxxxxyyyyyzzzzzz"
##D   consumerSecret <- "xxxxxxyyyyyzzzzzzz111111222222"
##D   my_oauth <- OAuthFactory$new(consumerKey=consumerKey,
##D     consumerSecret=consumerSecret, requestURL=requestURL,
##D     accessURL=accessURL, authURL=authURL)
##D   my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
##D 
##D ## Alternatively, it is also possible to create a token without the handshake:
##D  my_oauth <- list(consumer_key = "CONSUMER_KEY",
##D    consumer_secret = "CONSUMER_SECRET",
##D    access_token="ACCESS_TOKEN",
##D    access_token_secret = "ACCESS_TOKEN_SECRET")
##D 
##D ## capture 10 tweets mentioning the "Rstats" hashtag
##D   filterStream( file.name="tweets_rstats.json", 
##D      track="rstats", tweets=10, oauth=my_oauth )
##D 
##D ## capture tweets published by Twitter's official account      
##D   filterStream( file.name="tweets_twitter.json", 
##D      follow="783214", timeout=600, oauth=my_oauth )
##D 
##D ## capture tweets sent from New York City in Spanish only, and saving as an object in memory
##D   tweets <- filterStream( file.name="", language="es",
##D       locations=c(-74,40,-73,41), timeout=600, oauth=my_oauth )  
##D 
##D ## capture tweets mentioning the "rstats" hashtag or sent from New York City
##D   filterStream( file="tweets_rstats.json", track="rstats",
##D       locations=c(-74,40,-73,41), timeout=600, oauth=my_oauth )
##D 
## End(Not run)




