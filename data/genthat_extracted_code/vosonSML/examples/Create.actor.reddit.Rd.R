library(vosonSML)


### Name: Create.actor.reddit
### Title: Create reddit actor network
### Aliases: Create.actor.reddit

### ** Examples

## Not run: 
##D # create a reddit actor network graph with comment text as edge attributes
##D actorNetwork <- redditData %>% 
##D   Create("actor", includeTextData = TRUE, writeToFile = TRUE)
##D 
##D # igraph object
##D # actorNetwork$graph
## End(Not run)




