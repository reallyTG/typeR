library(vosonSML)


### Name: SaveCredential
### Title: Save and load credential information
### Aliases: SaveCredential LoadCredential LoadCredential

### ** Examples


## Not run: 
##D require(magrittr)
##D myAppID <- "123456789098765"
##D myAppSecret <- "abc123abc123abc123abc123abc123ab"
##D myUsernames <- c("senjohnmccain","obama")
##D 
##D Authenticate("instagram",
##D appID = myAppId,
##D appSecret = myAppSecret) %>% SaveCredential("instagramCred.RDS") %>% Collect(ego = TRUE,
##D username = myUsernames) %>% Create
##D 
##D ## Load the previously saved credential information
##D LoadCredential("instagramCred.RDS") %>% Collect(tag="obama",
##D distance=5000, n=100) %>% Create("bimodal")
## End(Not run)



