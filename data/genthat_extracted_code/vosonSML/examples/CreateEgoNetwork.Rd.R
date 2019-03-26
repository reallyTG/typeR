library(vosonSML)


### Name: CreateEgoNetwork
### Title: Note: this function is DEPRECATED and will be removed in a
###   future release. Please use the 'Create' function
### Aliases: CreateEgoNetwork
### Keywords: SNA igraph instagram media network social unimodal

### ** Examples


## Not run: 
##D   ## Use your own values for myAppID and myAppSecret
##D   myAppID <- "123456789098765"
##D   myAppSecret <- "abc123abc123abc123abc123abc123ab"
##D 
##D   # Authenticate with the Instagram API using `AuthenticateWithInstagramAPI`
##D   instagram_oauth_token <- AuthenticateWithInstagramAPI(appID=app_id, appSecret=app_secret,
##D     useCachedToken=TRUE)
##D 
##D   myUsernames <- c("senjohnmccain","obama")
##D 
##D   g_ego_network <- CreateEgoNetwork(username=myUsernames,verbose=TRUE,degreeEgoNet=1,
##D     writeToFile=FALSE,waitForRateLimit=TRUE,getFollows=FALSE)
##D 
##D   # Description of actor network
##D   g_ego_network
## End(Not run)



