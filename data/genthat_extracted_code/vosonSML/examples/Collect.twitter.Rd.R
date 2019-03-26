library(vosonSML)


### Name: Collect.twitter
### Title: Collect tweet data from twitter search
### Aliases: Collect.twitter

### ** Examples

## Not run: 
##D # search and collect 100 recent tweets for the hashtag #auspol
##D myTwitterData <- twitterAuth %>% 
##D   Collect(searchTerm = "#auspol", searchType = "recent", numTweets = 100, verbose = TRUE, 
##D           includeRetweets = FALSE, retryOnRateLimit = TRUE, writeToFile = TRUE)
## End(Not run)




