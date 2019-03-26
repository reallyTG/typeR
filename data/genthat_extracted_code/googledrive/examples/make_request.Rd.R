library(googledrive)


### Name: make_request
### Title: Make a request for the Google Drive v3 API
### Aliases: make_request do_request do_paginated_request

### ** Examples

## Not run: 
##D ## build a request for an endpoint that is:
##D ##   * paginated
##D ##   * NOT privileged in googledrive, i.e. not covered by generate_request()
##D ## "comments" are a great example
##D ## https://developers.google.com/drive/v3/reference/comments
##D ##
##D ## Practice with a target file with > 2 comments
##D ## Note that we request 2 items (comments) per page
##D req <- build_request(
##D   path = "drive/v3/files/{fileId}/comments",
##D   method = "GET",
##D   params = list(
##D     fileId = "your-file-id-goes-here",
##D     fields = "*",
##D     pageSize = 2
##D   ),
##D   token = googledrive:::drive_token()
##D )
##D ## make the paginated request, but cap it at 1 page
##D ## should get back exactly two comments
##D do_paginated_request(req, n_max = 1)
## End(Not run)



