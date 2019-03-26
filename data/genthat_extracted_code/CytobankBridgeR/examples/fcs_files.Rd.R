library(CytobankBridgeR)


### Name: fcs_files.download_fcs_files_stable
### Title: FCS Files
### Aliases: fcs_files fcs_files.download_fcs_files_stable

### ** Examples

## No test: 
fcs_files.download_fcs_files_stable(cyto_session, 22, fcs_files=c(1,2,3),
  directory="/my/new/download/directory/")
## End(No test)
## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)



