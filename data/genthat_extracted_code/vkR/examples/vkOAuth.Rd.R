library(vkR)


### Name: vkOAuth
### Title: Client authorization
### Aliases: vkOAuth

### ** Examples

## Not run: 
##D # an example of an authenticated request
##D vkOAuth(client_id = 123456,
##D         scope = "friends,groups,messages",
##D         email = "your_email@example.com",
##D         password = "your_secret_password")
##D 
##D # save access token for future sessions
##D at <- getAccessToken()
##D 
##D # an example of request
##D me()
##D 
##D # an example of an authenticated request without specifying email and password
##D vkOAuth(client_id = 123456, scope = "friends,groups,messages")
##D 
##D # copy access token from browser address bar
##D setAccessToken("your_secret_access_token")
## End(Not run)



