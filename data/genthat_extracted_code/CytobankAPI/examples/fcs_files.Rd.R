library(CytobankAPI)


### Name: fcs_files
### Title: FCS File Endpoints
### Aliases: fcs_files fcs_files.download,UserSession-method
###   fcs_files.download fcs_files.download_zip,UserSession-method
###   fcs_files.download_zip
###   fcs_files.file_internal_comp_show,UserSession-method
###   fcs_files.file_internal_comp_show fcs_files.list,UserSession-method
###   fcs_files.list fcs_files.show,UserSession-method fcs_files.show
###   fcs_files.upload,UserSession-method fcs_files.upload
###   fcs_files.upload_zip,UserSession-method fcs_files.upload_zip

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
# Download an FCS file to the current working directory
fcs_files.download(cyto_session, 22, fcs_file_id=2)

# Download an FCS file to a new directory
fcs_files.download(cyto_session, 22, fcs_file_id=2, directory="/my/new/download/directory/")
## End(No test)
## No test: 
# Download all files, to the current directory
fcs_files.download_zip(cyto_session, 22)

# Download specific files, to a new directory
fcs_files.download_zip(cyto_session, 22, fcs_files=c(22, 23, 24, 25),
  directory="/my/new/download/directory/")
## End(No test)
## No test: 
# List of a file internal compensation, containing a file internal compensation matrix
fcs_files.file_internal_comp_show(cyto_session, 22, fcs_file_id=2)

# Dataframe only of a file internal compensation
fcs_files.file_internal_comp_show(cyto_session, 22, fcs_file_id=2, output="dataframe")

# Raw list of a file internal compensation
fcs_files.file_internal_comp_show(cyto_session, 22, fcs_file_id=2, output="raw")
## End(No test)
## No test: 
# Dataframe of all FCS files with all fields present
fcs_files.list(cyto_session, 22)

# Raw list of all FCS files with all fields present
fcs_files.list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
fcs_files.show(cyto_session, 22, fcs_file_id=2)
## End(No test)
## No test: 
fcs_files.upload(cyto_session, 22, file_path="/path/to/my_fcs_file.fcs")
## End(No test)
## No test: 
fcs_files.upload_zip(cyto_session, 22, file_path="/path/to/my_fcs_files.zip")
## End(No test)



