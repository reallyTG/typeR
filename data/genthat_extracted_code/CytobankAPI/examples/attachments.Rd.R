library(CytobankAPI)


### Name: attachments
### Title: Attachment Endpoints
### Aliases: attachments attachments.delete,UserSession-method
###   attachments.delete attachments.download,UserSession-method
###   attachments.download attachments.download_zip,UserSession-method
###   attachments.download_zip attachments.list,UserSession-method
###   attachments.list attachments.show,UserSession-method attachments.show
###   attachments.update,UserSession-method attachments.update
###   attachments.upload,UserSession-method attachments.upload

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
attachments.delete(cyto_session, 22, attachment_id=2)
## End(No test)
## No test: 
# Download an attachment to the current working directory
attachments.download(cyto_session, 22, attachment_id=2)

# Download an attachment to a new directory
attachments.download(cyto_session, 22, attachment_id=2, directory="/my/new/download/directory/")
## End(No test)
## No test: 
# Download the attachment zip to the current working directory
attachments.download_zip(cyto_session, 22, attachment_id=2)

# Download the attachment zip to a new directory
attachments.download_zip(cyto_session, 22, attachment_id=2, directory="/my/new/download/directory/")
## End(No test)
## No test: 
# Dataframe of all attachments with all fields present
attachments.list(cyto_session, 22)

# Raw list of all attachments with all fields present
attachments.list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
attachments.show(cyto_session, 22, attachment_id=2)
## End(No test)
## No test: 
attachments.update(cyto_session, attachment=cyto_attachment)
## End(No test)
## No test: 
attachments.upload(cyto_session, 22, file_path="/path/to/my_attachment.txt")
## End(No test)



