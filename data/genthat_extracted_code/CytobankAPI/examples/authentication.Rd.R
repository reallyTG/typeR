library(CytobankAPI)


### Name: authentication
### Title: Authentication Endpoints
### Aliases: authentication authenticate
###   authentication.logout,UserSession-method authentication.logout
###   authentication.revoke_all_tokens,UserSession-method
###   authentication.revoke_all_tokens
###   authentication.revoke_all_tokens_user,UserSession-method
###   authentication.revoke_all_tokens_user

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
authentication.logout(cyto_session)
## End(No test)
## No test: 
authentication.revoke_all_tokens(cyto_session)
## End(No test)
## No test: 
authentication.revoke_all_tokens_user(cyto_session)
## End(No test)



