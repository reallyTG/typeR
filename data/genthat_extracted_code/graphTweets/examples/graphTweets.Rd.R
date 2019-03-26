library(graphTweets)


### Name: graphTweets
### Title: 'graphTweets' visualise Twitter Interactions.
### Aliases: graphTweets graphTweets-package
### Keywords: internal

### ** Examples

## Not run: 
##D library(rtweet)
##D 
##D tweets <- search_tweets("#rstats")
##D 
##D library(graphTweets)
##D 
##D # simple network
##D tweets %>% 
##D   gt_edges(screen_name, mentions_screen_name) %>% # get edges
##D   gt_nodes %>% # get nodes
##D   gt_graph %>% # build igraph object
##D   plot(.)
## End(Not run)




