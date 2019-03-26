library(rtweet)


### Name: lists_members
### Title: Get Twitter list members (users on a given list).
### Aliases: lists_members lists_memberships

### ** Examples

## Not run: 
##D 
##D ## get list members for a list of polling experts using list_id
##D (pollsters <- lists_members("105140588"))
##D 
##D ## get list members of cspan's senators list
##D sens <- lists_members(slug = "senators", owner_user = "cspan")
##D sens
##D 
##D ## get list members for an rstats list using list topic slug
##D ## list owner's screen name
##D rstats <- lists_members(slug = "rstats", owner_user = "scultrera")
##D rstats
##D 
## End(Not run)

## Not run: 
##D 
##D ## get up to 1000 Twitter lists that include Nate Silver
##D ns538 <- lists_memberships("NateSilver538", n = 1000)
##D 
##D ## view data
##D ns538
##D 
## End(Not run)




