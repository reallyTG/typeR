library(CytobankAPI)


### Name: panels
### Title: Panel Endpoints
### Aliases: panels panels.list,UserSession-method panels.list
###   panels.show,UserSession-method panels.show

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
# Full panel list with all fields present, with a dataframe of channels
panels.list(cyto_session, 22)

# Raw list of all panels with all fields present
panels.list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
# Full panel info with all fields present
panels.show(cyto_session, 22, panel_id=2)
## End(No test)



