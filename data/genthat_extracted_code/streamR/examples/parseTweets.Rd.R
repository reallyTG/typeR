library(streamR)


### Name: parseTweets
### Title: Converts tweets in JSON format to data frame.
### Aliases: parseTweets

### ** Examples

## The dataset example_tweets contains 10 public statuses published
## by @twitterapi in plain text format. The code below converts the object
## into a data frame that can be manipulated by other functions.

data(example_tweets)
tweets.df <- parseTweets(example_tweets, simplify=TRUE, legacy=TRUE)

## Not run: 
##D ## A more complete example, that shows how to capture a user's home timeline
##D ## for one hour using authentication via OAuth, and then parsing the tweets
##D ## into a data frame.
##D 
##D  library(ROAuth)
##D  reqURL <- "https://api.twitter.com/oauth/request_token"
##D  accessURL <- "https://api.twitter.com/oauth/access_token"
##D  authURL <- "https://api.twitter.com/oauth/authorize"
##D  consumerKey <- "xxxxxyyyyyzzzzzz"
##D  consumerSecret <- "xxxxxxyyyyyzzzzzzz111111222222"
##D  my_oauth <- OAuthFactory$new(consumerKey=consumerKey,
##D                               consumerSecret=consumerSecret,
##D                               requestURL=reqURL,
##D                               accessURL=accessURL,
##D                               authURL=authURL)
##D  my_oauth$handshake()
##D  userStream( file="my_timeline.json", with="followings",
##D          timeout=3600, oauth=my_oauth )
##D  tweets.df <- parseTweets("my_timeline.json")
## End(Not run) 





