library(vosonSML)


### Name: CreateSemanticNetwork
### Title: Note: this function is DEPRECATED and will be removed in a
###   future release. Please use the 'Create' function
### Aliases: CreateSemanticNetwork
### Keywords: SNA igraph media network semantic social

### ** Examples


## Not run: 
##D   ## This example shows how to collect Twitter data and create a semantic network
##D 
##D   # Firstly specify your API credentials
##D   my_api_key <- "1234567890qwerty"
##D   my_api_secret <- "1234567890qwerty"
##D   my_access_token <- "1234567890qwerty"
##D   my_access_token_secret <- "1234567890qwerty"
##D 
##D   # Authenticate with the Twitter API using \code{AuthenticateWithTwitterAPI}
##D   AuthenticateWithTwitterAPI(api_key=my_api_key, api_secret=my_api_secret,
##D     access_token=my_access_token, access_token_secret=my_access_token_secret)
##D 
##D   # Collect tweets data using \code{myTwitterData}
##D   myTwitterData <- CollectDataTwitter(searchTerm="#auspol",
##D     numTweets=200,writeToFile=FALSE,verbose=FALSE)
##D 
##D   # Create a 'semantic' network using \code{CreateSemanticNetwork}
##D   g_semantic_twitter <- CreateSemanticNetwork(myTwitterData,writeToFile=FALSE,
##D     termFreq=20,hashtagFreq=80)
## End(Not run)




