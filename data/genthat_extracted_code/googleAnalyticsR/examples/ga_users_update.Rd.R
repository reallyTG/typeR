library(googleAnalyticsR)


### Name: ga_users_update
### Title: Update a user access in Google Analytics
### Aliases: ga_users_update

### ** Examples


## Not run: 
##D 
##D library(googleAnalyticsR)
##D ga_auth()
##D 
##D # the update to perform
##D o <- list(permissions = list(local = list("EDIT")))
##D 
##D ga_users_update("UA-123456-1:1111222233334444",
##D                 update_object = o,
##D                 accountId = 47480439,
##D                 webPropertyId = "UA-123456-1")
##D                 
## End(Not run)



