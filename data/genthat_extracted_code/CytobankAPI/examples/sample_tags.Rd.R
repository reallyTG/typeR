library(CytobankAPI)


### Name: sample_tags
### Title: Sample Tag Endpoints
### Aliases: sample_tags sample_tags.download,UserSession-method
###   sample_tags.download sample_tags.upload,UserSession-method
###   sample_tags.upload

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
# Download the experiment sample tags TSV to the current working directory
sample_tags.download(cyto_session, 22)

# Download the experiment sample tags TSV to a new directory
sample_tags.download(cyto_session, 22, directory="/my/new/download/directory/")
## End(No test)
## No test: 
sample_tags.upload(cyto_session, 22, file_path="/path/to/my_annotations.tsv")
## End(No test)



