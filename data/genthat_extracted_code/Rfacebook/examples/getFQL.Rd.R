library(Rfacebook)


### Name: getFQL
### Title: Executes a FQL query to the Facebook Graph API
### Aliases: getFQL

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D ## Getting list of friends of authenticated user
##D load("fb_oauth")
##D d <- getFQL("SELECT uid2 FROM friend WHERE uid1=me()", token=fb_oauth)
## End(Not run)




