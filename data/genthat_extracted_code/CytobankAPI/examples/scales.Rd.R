library(CytobankAPI)


### Name: scales
### Title: Scale Endpoints
### Aliases: scales scales.list,UserSession-method scales.list
###   scales.show,UserSession-method scales.show
###   scales.update,UserSession-method scales.update

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
# Dataframe of all scales with all fields present
scales.list(cyto_session, 22)

# Raw list of all scales with all fields present
scales.list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
scales.show(cyto_session, 22, scale_id=2)
## End(No test)
## No test: 
# Update any number of parameters (scale_type, cofactor, minimum, maximum)
# Scale Types -- 1: Linear, 2: Log, 4: Arcsinh
scales.update(cyto_session, scale=cyto_scale)
## End(No test)



