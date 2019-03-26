library(rtweet)


### Name: tweets_with_users
### Title: Parsing data into tweets/users data tibbles
### Aliases: tweets_with_users users_with_tweets

### ** Examples

## Not run: 
##D ## search with parse = FALSE
##D rt <- search_tweets("rstats", n = 500, parse = FALSE)
##D 
##D ## parse to tweets data tibble with users data attribute object
##D tweets_with_users(rt)
##D 
##D ## search with parse = FALSE
##D usr <- search_users("rstats", n = 300, parse = FALSE)
##D 
##D ## parse to users data tibble with users data attribute object
##D users_with_tweets(usr)
##D 
## End(Not run)



