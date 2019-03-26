library(streamR)


### Name: userStream
### Title: Connect to Twitter Streaming API and return messages for a
###   single user.
### Aliases: userStream

### ** Examples

## Not run: 
##D ## The following example shows how to capture a user's home timeline
##D ## with the Streaming API and using authentication via the ROAuth
##D ## package, with fictitious consumerkey and consumer secret.
##D ## You can obtain your own at dev.twitter.com
##D  library(ROAuth)
##D  requestURL <- "https://api.twitter.com/oauth/request_token"
##D  accessURL <- "https://api.twitter.com/oauth/access_token"
##D  authURL <- "https://api.twitter.com/oauth/authorize"
##D  consumerKey <- "xxxxxyyyyyzzzzzz"
##D  consumerSecret <- "xxxxxxyyyyyzzzzzzz111111222222"
##D  my_oauth <- OAuthFactory$new(consumerKey=consumerKey,
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
##D ## Capturing 10 tweets from a user's timeline
##D  userStream( file.name="my_timeline.json", with="followings",
##D      tweets=10, oauth=my_oauth )
## End(Not run)




