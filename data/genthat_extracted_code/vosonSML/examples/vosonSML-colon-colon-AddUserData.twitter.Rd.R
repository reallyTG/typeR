library(vosonSML)


### Name: vosonSML::AddUserData.twitter
### Title: Enhances twitter actor network graph by adding user attributes
###   to nodes
### Aliases: vosonSML::AddUserData.twitter AddUserData.twitter

### ** Examples

## Not run: 
##D # add additional twitter user profile information to actor network graph as node attributes 
##D # requires twitterAuth from Authenticate, twitterData from Collect and actorNetwork from 
##D # Create actor network
##D actorNetWithUserAttr <- AddUserData.twitter(twitterData, actorNetwork,
##D                                             lookupUsers = TRUE, 
##D                                             twitterAuth = twitterAuth, writeToFile = TRUE)
##D # igraph object
##D # actorNetWithUserAttr$graph
## End(Not run)




