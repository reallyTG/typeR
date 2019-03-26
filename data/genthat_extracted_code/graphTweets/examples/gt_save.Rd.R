library(graphTweets)


### Name: gt_save
### Title: Save
### Aliases: gt_save

### ** Examples

## Not run: 
##D # simulate dataset
##D tweets <- data.frame(
##D   text = c("I tweet @you about @him", 
##D            "I tweet @me about @you"),
##D   screen_name = c("me", "him"),
##D   retweet_count = c(19, 5),
##D   created_at = c(Sys.time(), Sys.time() + 15000),
##D   status_id = c(1, 2),
##D   stringsAsFactors = FALSE
##D )
##D 
##D tweets %>% 
##D   gt_edges(text, screen_name, "created_at") %>% 
##D   gt_nodes(TRUE) %>% 
##D   gt_dyn() %>% 
##D   gt_save()
## End(Not run)




