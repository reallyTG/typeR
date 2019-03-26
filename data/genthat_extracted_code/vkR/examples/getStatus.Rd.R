library(vkR)


### Name: getStatus
### Title: Returns data required to show the status of a users and/or
###   communities
### Aliases: getStatus

### ** Examples

## Not run: 
##D status.me <- getStatus()
##D status.friends <- getStatus(users_ids = getFriends()$items)
##D status.groups  <- getStatus(groups_ids = getGroups()$items)
##D status.friends_and_groups <- getStatus(users_ids = getFriends()$items,
##D  groups_ids = getGroups()$items, progress_bar = T)
## End(Not run)



