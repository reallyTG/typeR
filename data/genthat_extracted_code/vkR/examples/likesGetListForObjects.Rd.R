library(vkR)


### Name: likesGetListForObjects
### Title: Returns a list of IDs of users who added the specified objects
###   to their Likes list
### Aliases: likesGetListForObjects

### ** Examples

## Not run: 
##D wall <- getWallExecute(domain = 'privivkanet', count = 10, progress_bar = TRUE)
##D post_likers <- likesGetListForObjects(wall, type = 'post', progress_bar = TRUE)
##D post_likers_extended <- likesGetListForObjects(wall, type = 'post',
##D    extended = 1, progress_bar = TRUE)
## End(Not run)



