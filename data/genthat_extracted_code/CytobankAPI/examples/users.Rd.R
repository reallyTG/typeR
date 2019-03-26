library(CytobankAPI)


### Name: users
### Title: User Endpoints
### Aliases: users users.list,UserSession-method users.list
###   users.show,UserSession-method users.show

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
# Dataframe of all users with all fields present
users.list(cyto_session)

# Raw list of all useres with all fields present
users.list(cyto_session, output="raw")
## End(No test)
## No test: 
users.show(cyto_session, user_id=2)
## End(No test)



