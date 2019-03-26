library(vosonSML)


### Name: GetYoutubeVideoIDs
### Title: Extract/scrape the IDs from a set of YouTube video URLs
### Aliases: GetYoutubeVideoIDs
### Keywords: scraping vosonSML youtube

### ** Examples


## Not run: 
##D   ## This example shows how to use `GetYoutubeVideoIDs` to extract video IDs from YouTube
##D   ## video URLs, and then collect data using the function `CollectDataYoutube`
##D 
##D   # Use your own Google Developer API Key here:
##D   myApiKey <- "1234567890"
##D 
##D   # Authenticate with the Google API
##D   apiKeyYoutube <- AuthenticateWithYoutubeAPI(apiKeyYoutube=myApiKey)
##D 
##D   # Use the function `GetYoutubeVideoIDs` to automatically generate vector of IDs from
##D   # a plain text file of video URLs
##D   videoIDs <- GetYoutubeVideoIDs(file="youtube_to_scrape.txt")
##D 
##D   # Collect the data using function `CollectDataYoutube`
##D   myYoutubeData <- CollectDataYoutube(videoIDs,apiKeyYoutube,writeToFile=FALSE)
## End(Not run)



