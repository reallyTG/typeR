library(rtweet)


### Name: tweets_data
### Title: Extracts tweets data from users data object.
### Aliases: tweets_data tweet_data data_tweet data_tweets

### ** Examples

## Not run: 
##D ## get twitter user data
##D jack <- lookup_users("jack")
##D 
##D ## get data on most recent tweet from user(s)
##D tweets_data(jack)
##D 
##D ## search for 100 tweets containing the letter r
##D r <- search_tweets("r")
##D 
##D ## print tweets data (only first 10 rows are shown)
##D head(r, 10)
##D 
##D ## preview users data
##D head(users_data(r))
## End(Not run)




