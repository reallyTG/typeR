library(CytobankAPI)


### Name: drop
### Title: DROP File Endpoints
### Aliases: drop drop.upload,UserSession-method drop.upload

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
drop.upload(cyto_session, 22, file_path="/path/to/my_drop_file.type",
  data_matrix_start_row=2, data_matrix_start_column=1, skipped_columns=c(4,8))
## End(No test)



