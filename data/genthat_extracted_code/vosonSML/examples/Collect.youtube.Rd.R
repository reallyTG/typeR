library(vosonSML)


### Name: Collect.youtube
### Title: Collect comments data for youtube videos
### Aliases: Collect.youtube

### ** Examples

## Not run: 
##D # create a list of youtube video ids to collect on
##D videoIDs <- GetYoutubeVideoIDs(c("https://www.youtube.com/watch?v=xxxxxxxx", 
##D                                  "https://youtu.be/xxxxxxxx"))
##D 
##D # collect approximately 200 threads/comments for each youtube video
##D youtubeData <- youtubeAuth %>% 
##D   Collect(videoIDs = videoIDs, writeToFile = TRUE, verbose = FALSE, maxComments = 200)
## End(Not run)




