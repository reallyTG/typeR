library(googledrive)


### Name: generate_request
### Title: Build a request for the Google Drive v3 API
### Aliases: generate_request build_request

### ** Examples

## Not run: 
##D req <- generate_request(
##D   "drive.files.get",
##D   list(fileId = "abc"),
##D   token = drive_token()
##D )
##D req
## End(Not run)
## re-create the previous request, but the hard way, i.e. "by hand"
req <- build_request(
  path = "drive/v3/files/{fileId}",
  method = "GET",
  list(fileId = "abc", key = "an-api-key"),
  token = NULL
)
req

## call an endpoint not used by googledrive
## List a file's comments
## https://developers.google.com/drive/v3/reference/comments/list
## Not run: 
##D req <- build_request(
##D   path = "drive/v3/files/{fileId}/comments",
##D   method = "GET",
##D   params = list(
##D     fileId = "your-file-id-goes-here",
##D     fields = "*"
##D   ),
##D   token = drive_token()
##D )
##D process_response(make_request(req))
## End(Not run)



