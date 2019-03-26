library(graphTweets)


### Name: gt_dyn
### Title: Dynamise
### Aliases: gt_dyn

### ** Examples

## Not run: 
##D # simulate dataset
##D tweets <- data.frame(
##D   text = c("I tweet @you about @him and @her", 
##D            "I tweet @me about @you"),
##D   screen_name = c("me", "him"),
##D   created_at = c(Sys.time(), Sys.time() + 10000),
##D   status_id = c(1, 2),
##D   stringsAsFactors = FALSE
##D )
##D 
##D tweets %>% 
##D   gt_edges(text, screen_name, status_id, "created_at") %>% 
##D   gt_nodes() %>% 
##D   gt_dyn() %>% 
##D   gt_collect() -> net
## End(Not run)




