library(graphTweets)


### Name: gt_collect
### Title: Collect
### Aliases: gt_collect

### ** Examples

# simulate dataset
tweets <- data.frame(
  text = c("I tweet @you about @him", 
           "I tweet @me about @you"),
  screen_name = c("me", "him"),
  retweet_count = c(19, 5),
  status_id = c(1, 2),
  stringsAsFactors = FALSE
)

tweets %>% 
  gt_edges(text, screen_name, status_id) %>% 
  gt_nodes() %>% 
  gt_collect() -> net




