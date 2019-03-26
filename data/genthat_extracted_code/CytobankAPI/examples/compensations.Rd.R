library(CytobankAPI)


### Name: compensations
### Title: Compensation Endpoints
### Aliases: compensations compensations.upload_csv,UserSession-method
###   compensations.upload_csv compensations.list,UserSession-method
###   compensations.list compensations.show,UserSession-method
###   compensations.show

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
compensations.upload_csv(cyto_session, 22, file_path="/path/to/my_compensation.csv")
## End(No test)
## No test: 
# List of all compensations with all fields present, with a compensation matrix dataframe list item
compensations.list(cyto_session, 22)

# Raw list of all compensations with all fields present
compensations.list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
# List form of a compensation
compensations.show(cyto_session, 22, compensation_id=2)

# Compensation dataframe only
compensations.show(cyto_session, 22, compensation_id=2, output="dataframe")
## End(No test)



