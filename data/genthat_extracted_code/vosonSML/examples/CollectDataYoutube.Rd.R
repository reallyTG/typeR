library(vosonSML)


### Name: CollectDataYoutube
### Title: Note: this function is DEPRECATED and will be removed in a
###   future release. Please use the 'Collect' function
### Aliases: CollectDataYoutube
### Keywords: SNA data mining youtube

### ** Examples


## Not run: 
##D   # Use your own Google Developer API Key here:
##D   myApiKey <- "1234567890"
##D 
##D   # Authenticate with the Google API
##D   apiKeyYoutube <- AuthenticateWithYoutubeAPI(apiKeyYoutube=myApiKey)
##D 
##D   # Generate a vector of YouTube video IDs to collect data from
##D   # (or use the function `GetYoutubeVideoIDs` to automatically
##D   # generate from a plain text file of video URLs)
##D   videoIDs <- c("W2GZFeYGU3s","mL27TAJGlWc")
##D 
##D   # Collect the data using function `CollectDataYoutube`
##D   myYoutubeData <- CollectDataYoutube(videoIDs,apiKeyYoutube,writeToFile=FALSE)
##D 
##D   # Create an 'actor' network using the function `CreateActorNetwork`
##D   g_actor_youtube <- CreateActorNetwork(myYoutubeData)
## End(Not run)



