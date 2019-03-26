library(vosonSML)


### Name: CollectDataTwitter
### Title: Note: this function is DEPRECATED and will be removed in a
###   future release. Please use the 'Collect' function
### Aliases: CollectDataTwitter
### Keywords: SNA data mining twitter

### ** Examples


## Not run: 
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
##D     numTweets=150,writeToFile=FALSE,verbose=FALSE)
##D 
##D   # Create an 'actor' network using \code{CreateActorNetwork}
##D   g_actor_twitter <- CreateActorNetwork(myTwitterData)
##D 
##D   # Create a 'bimodal' network using \code{CreateBimodalNetwork}
##D   g_bimodal_twitter <- CreateBimodalNetwork(myTwitterData)
##D 
##D   # Create a 'semantic' network using \code{CreateSemanticNetwork}
##D   g_semantic_twitter <- CreateSemanticNetwork(myTwitterData)
##D   
## End(Not run)



