library(vosonSML)


### Name: CollectEgoInstagram
### Title: Note: this function is DEPRECATED and will be removed in a
###   future release. Please use the 'Collect' function
### Aliases: CollectEgoInstagram

### ** Examples


## Not run: 
##D myAppID <- "123456789098765"
##D myAppSecret <- "abc123abc123abc123abc123abc123ab"
##D 
##D # Authenticate with the Instagram API using `AuthenticateWithInstagramAPI`
##D instagram_oauth_token <- AuthenticateWithInstagramAPI(appID=myAppI,
##D appSecret=myAppSecret, useCachedToken=TRUE)
##D 
##D myUsernames <- c("senjohnmccain","obama")
##D instagramEgodata <- CollectEgoInstgram(username=myUsernames,
##D verbose=TRUE,degreeEgoNet=1, waitForRateLimit=TRUE,
##D getFollows=FALSE)
##D Create(instagramEgodata)
## End(Not run)



