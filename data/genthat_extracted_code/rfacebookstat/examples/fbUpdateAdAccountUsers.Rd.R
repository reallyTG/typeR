library(rfacebookstat)


### Name: fbUpdateAdAccountUsers
### Title: Add users and update permission list.
### Aliases: fbUpdateAdAccountUsers

### ** Examples

## Not run: 
##D #Attach package
##D library(rfacebookstat)
##D 
##D #Get token, where 0000000000000 is id of your app in facebook
##D tk <- fbGetToken(0000000000000) 
##D 
##D #Add user with id 001 and 002 to accounts act_0001 and act_0002
##D fbUpdateAdAccountUsers(user_ids = c("001","002"), 
##D                        accounts_id = c("act_0001","act_0002"), 
##D                        role = "advertiser",
##D                        api_version = "v2.12",
##D                        access_token = tk)
## End(Not run)



