library(twitteR)


### Name: load_tweets_db
### Title: Functions to persist/load twitteR data to a database
### Aliases: load_tweets_db load_users_db store_tweets_db store_users_db
### Keywords: utilities

### ** Examples

   ## Not run: 
##D     register_sqlite_backend("/path/to/sqlite/file")
##D     tweets = searchTwitter("#scala")
##D     store_tweets_db(tweets)
##D     from_db = load_tweets_db()
##D    
## End(Not run)



