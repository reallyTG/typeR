library(CytobankAPI)


### Name: populations
### Title: Population Endpoints
### Aliases: populations populations.list,UserSession-method
###   populations.list populations.show,UserSession-method populations.show

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
# Dataframe of all populations with all fields present
populations.list(cyto_session, 22)

# Raw list of all populations with all fields present
populations.list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
populations.show(cyto_session, 22, population_id=2)
## End(No test)



