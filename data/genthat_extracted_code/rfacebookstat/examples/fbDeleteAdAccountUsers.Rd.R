library(rfacebookstat)


### Name: fbDeleteAdAccountUsers
### Title: Delete users from ad accounts.
### Aliases: fbDeleteAdAccountUsers

### ** Examples

## Not run: 
##D #Attach package
##D library(rfacebookstat)
##D #Get token, where 0000000000000 is id of your app in facebook
##D tk <- fbGetToken(0000000000000) 
##D #Remove user with id 001 and 002 from accounts act_0001 and act_0002
##D fbDeleteAdAccountUsers(user_ids = c(001,002), 
##D                        accounts_id = c("act_0001","act_0002"), 
##D                        api_version = "v2.12",
##D                        access_token = "abcdef123456" )
## End(Not run)



