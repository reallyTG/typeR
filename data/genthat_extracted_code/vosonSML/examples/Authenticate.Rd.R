library(vosonSML)


### Name: Authenticate
### Title: Create credential to access social media APIs
### Aliases: Authenticate

### ** Examples


## Not run: 
##D require(magrittr)
##D ## Instagram ego network example
##D myAppID <- "123456789098765"
##D myAppSecret <- "abc123abc123abc123abc123abc123ab"
##D myUsernames <- c("senjohnmccain","obama")
##D 
##D Authenticate("instagram",
##D appID = myAappId,
##D appSecret = myAppSecret) %>% Collect(ego = TRUE,
##D username = myUsernames) %>% Create
##D 
##D ## YouTube actor network example
##D my_apiKeyYoutube <- "314159265358979qwerty"
##D videoIDs <- c("W2GZFeYGU3s","mL27TAJGlWc")
##D 
##D Authenticate("youtube",
##D apiKey = my_apiKeyYoutube) %>% Collect(videoIDs = videoIDs) %>% Create('actor')
## End(Not run)



