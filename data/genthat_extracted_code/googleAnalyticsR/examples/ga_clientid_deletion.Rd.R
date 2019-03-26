library(googleAnalyticsR)


### Name: ga_clientid_deletion
### Title: Create or update a user deletion request
### Aliases: ga_clientid_deletion

### ** Examples


## Not run: 
##D 
##D # make sure you are authenticated with user deletion scopes
##D options(googleAuthR.scopes.selected = "https://www.googleapis.com/auth/analytics.user.deletion")
##D ga_auth(new_user = TRUE)
##D 
##D # a vector of ids
##D ids <- c("1489547420.1526330722", "1138076389.1526568883")
##D 
##D # do the deletions
##D ga_clientid_deletion(ids, "UA-1234-2")
##D #                 userId   id_type  property      deletionRequestTime
##D #1 1489547420.1526330722 CLIENT_ID UA-1234-2 2018-05-20T19:43:33.540Z
##D #2 1138076389.1526568883 CLIENT_ID UA-1234-2 2018-05-20T19:43:36.218Z
##D 
## End(Not run)




