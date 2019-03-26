library(Rfacebook)


### Name: searchGroup
### Title: Find Facebook ID of a group
### Aliases: searchGroup

### ** Examples

## Not run: 
##D ## Find Facebook ID for R-Users Facebook group
##D load("fb_oauth")
##D ids <- searchGroup(name="rusers", token=fb_oauth)
##D  ids[1,] # id = 18533493739
##D ## Downloading posts from R-Users Facebook group
##D  group <- getGroup(group_id=18533493739, token=fb_oauth)
##D ## Downloading posts from R-Users Facebook group in January 2013
##D  group <- getGroup(group_id=18533493739, token=fb_oauth,
##D 	since='2013/01/01', until='2013/01/31')
## End(Not run)



