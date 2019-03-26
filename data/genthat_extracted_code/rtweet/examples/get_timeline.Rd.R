library(rtweet)


### Name: get_timeline
### Title: Get one or more user timelines (tweets posted by target
###   user(s)).
### Aliases: get_timeline get_timelines

### ** Examples


## Not run: 
##D 
##D ## get most recent 3200 tweets posted by Donald Trump's account
##D djt <- get_timeline("realDonaldTrump", n = 3200)
##D 
##D ## data frame where each observation (row) is a different tweet
##D djt
##D 
##D ## users data for realDonaldTrump is also retrieved
##D users_data(djt)
##D 
##D ## retrieve timelines of mulitple users
##D tmls <- get_timeline(c("KFC", "ConanOBrien", "NateSilver538"), n = 1000)
##D 
##D ## it's returned as one data frame
##D tmls
##D 
##D ## count observations for each timeline
##D table(tmls$screen_name)
##D 
## End(Not run)




