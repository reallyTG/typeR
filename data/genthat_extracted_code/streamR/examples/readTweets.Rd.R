library(streamR)


### Name: readTweets
### Title: Converts tweets in JSON format to R list.
### Aliases: readTweets

### ** Examples

## The dataset example_tweets contains 10 public statuses published
## by @twitterapi in plain text format. The code below converts the object
## into a list and extracts only the text.

data(example_tweets)
tweets.list <- readTweets(example_tweets)
only.text <- unlist(lapply(tweets.list, '[[', 'text'))
## it can be done with an explicit loop:
only.text <- c()
for (i in 1:length(tweets.list)){
   only.text[i] <- tweets.list[[i]]['text']
}
print(unlist(only.text))






