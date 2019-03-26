library(CytobankAPI)


### Name: gates
### Title: Gate Endpoints
### Aliases: gates gates.gatingML_download,UserSession-method
###   gates.gatingML_download gates.gatingML_upload,UserSession-method
###   gates.gatingML_upload gates.list,UserSession-method gates.list
###   gates.show,UserSession-method gates.show

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
gates.gatingML_download(cyto_session, 22, directory="/my/new/download/directory/")
## End(No test)
## No test: 
gates.gatingML_upload(cyto_session, 22, file_path="/path/to/my_gatingML.xml")
## End(No test)
## No test: 
# Dataframe of all gates with all fields present
gates.list(cyto_session, 22)

# Raw list of all gates with all fields present
gates.list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
gates.show(cyto_session, 22, gate_id=2)
## End(No test)



