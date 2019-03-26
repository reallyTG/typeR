library(RedditExtractoR)


### Name: user_network
### Title: User relationship network
### Aliases: user_network

### ** Examples

## Not run: 
##D # load libraries
##D library(dplyr)
##D library(RedditExtractoR)
##D target_urls <- reddit_urls(search_terms="cats", subreddit="Art", cn_threshold=50)
##D target_df <- target_urls %>% 
##D filter(num_comments==min(target_urls$num_comments)) %$% 
##D URL %>% reddit_content # get the contents of a small thread
##D network_list <- target_df %>% user_network(include_author=FALSE, agg=TRUE) # extract the network
##D network_list$plot # explore the plot
##D str(network_list$df) # check out the contents
## End(Not run)



