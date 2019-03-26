library(googleAnalyticsR)


### Name: ga_users_delete_linkid
### Title: Delete users access from account, webproperty or view level
### Aliases: ga_users_delete_linkid

### ** Examples


## Not run: 
##D 
##D library(googleAnalyticsR)
##D ga_auth()
##D 
##D # get the linkId for the user you want to delete
##D ga_users_list(47480439, webPropertyId = "UA-47480439-2", viewId = 81416156)
##D ga_users_delete_linkid("81416156:114834495587136933146", 
##D                        accountId = 47480439, 
##D                        webPropertyId = "UA-47480439-2", 
##D                        viewId = 81416156)
##D 
##D # check its gone
##D ga_users_list(47480439, webPropertyId = "UA-47480439-2", viewId = 81416156)
##D 
##D # can only delete at level user has access, the above deletion woud have failed if via:
##D ga_users_delete_linkid("47480439:114834495587136933146", 47480439)
##D 
## End(Not run)



