library(salesforcer)


### Name: sf_auth
### Title: Log in to Salesforce
### Aliases: sf_auth

### ** Examples

## Not run: 
##D # log in using basic authentication (username-password)
##D sf_auth(username = "test@gmail.com", 
##D         password = "test_password", 
##D         security_token = )
##D 
##D # log in using OAuth 2.0
##D # Via brower or refresh of .httr-oauth-salesforcer
##D sf_auth()
##D 
##D # Save token and log in using it
##D saveRDS(.state$token, "token.rds")
##D sf_auth(token = "token.rds")
## End(Not run)



