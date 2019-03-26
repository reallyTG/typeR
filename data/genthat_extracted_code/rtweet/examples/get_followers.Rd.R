library(rtweet)


### Name: get_followers
### Title: Get user IDs for accounts following target user.
### Aliases: get_followers

### ** Examples


## Not run: 
##D 
##D ## get 5000 ids of users following the KFC account
##D (kfc <- get_followers("KFC"))
##D 
##D ## get max number [per fresh token] of POTUS follower IDs
##D (pres <- get_followers("potus", n = 75000))
##D 
##D ## resume data collection (warning: rate limits reset every 15 minutes)
##D pres2 <- get_followers("potus", n = 75000, page = next_cursor(pres))
##D 
##D ## store next cursor in object before merging data
##D nextpage <- next_cursor(pres2)
##D 
##D ## merge data frames
##D pres <- rbind(pres, pres2)
##D 
##D ## store next cursor as an attribute in the merged data frame
##D attr(pres, "next_cursor") <- next_page
##D 
##D ## view merged ddata
##D pres
##D 
## End(Not run)




