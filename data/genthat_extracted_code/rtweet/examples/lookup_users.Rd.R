library(rtweet)


### Name: lookup_users
### Title: Get Twitter users data for given users (user IDs or screen
###   names).
### Aliases: lookup_users

### ** Examples


## Not run: 
##D 
##D ## select one or more twitter users to lookup
##D users <- c(
##D   "potus", "hillaryclinton", "realdonaldtrump",
##D   "fivethirtyeight", "cnn", "espn", "twitter"
##D )
##D 
##D ## get users data
##D usr_df <- lookup_users(users)
##D 
##D ## view users data
##D usr_df
##D 
##D ## view tweet data for these users via tweets_data()
##D tweets_data(usr_df)
##D 
## End(Not run)




