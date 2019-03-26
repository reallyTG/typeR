library(vosonSML)


### Name: CreateEgoNetworkFromData
### Title: Create 'ego' networks from social media data
### Aliases: CreateEgoNetworkFromData

### ** Examples


## Not run: 
##D myAppID <- "123456789098765"
##D myAppSecret <- "abc123abc123abc123abc123abc123ab"
##D instagram_oauth_token <- AuthenticateWithInstagramAPI(appID=myAppID,
##D appSecret=myAppSecret, useCachedToken=TRUE)
##D myUsernames <- c("senjohnmccain","obama")
##D instagramEgodata <- CollectEgoInstgram(username=myUsernames,
##D verbose=TRUE,degreeEgoNet=1,
##D waitForRateLimit=TRUE,getFollows=FALSE)
##D CreateEgoNetoworkFromData(instagramEgodata)
##D ## the same as Create(instagramEgodata) or Create(instagramEgodata, "ego")
## End(Not run)




