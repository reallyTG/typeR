library(graphTweets)


### Name: gt_edges_from_text
### Title: Edges from text
### Aliases: gt_edges_from_text gt_edges_from_text_

### ** Examples

# simulate dataset
tweets <- data.frame(
  text = c("I tweet @you about @him and @her", 
           "I tweet @me about @you"),
  screen_name = c("me", "him"),
  retweet_count = c(19, 5),
  status_id = c(1, 2),
  hashtags = c("rstats", "Python"),
  stringsAsFactors = FALSE
)

tweets %>% 
  gt_edges_from_text(status_id, screen_name, text)
    



