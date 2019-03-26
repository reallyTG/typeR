library(rtweet)


### Name: search_users
### Title: Get users data on accounts identified via search query.
### Aliases: search_users

### ** Examples


## Not run: 
##D 
##D ## search for up to 1000 users using the keyword rstats
##D rstats <- search_users(q = "rstats", n = 1000)
##D 
##D ## data frame where each observation (row) is a different user
##D rstats
##D 
##D ## tweets data also retrieved. can access it via tweets_data()
##D tweets_data(rstats)
##D 
## End(Not run)




