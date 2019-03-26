library(rtweet)


### Name: get_favorites
### Title: Get tweets data for statuses favorited by one or more target
###   users.
### Aliases: get_favorites

### ** Examples


## Not run: 
##D 
##D ## get max number of statuses favorited by KFC
##D kfc <- get_favorites("KFC", n = 3000)
##D kfc
##D 
##D ## get 400 statuses favorited by each of three users
##D favs <- get_favorites(c("Lesdoggg", "pattonoswalt", "meganamram"))
##D favs
##D 
## End(Not run)




