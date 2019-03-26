library(backblazer)


### Name: b2UploadFile
### Title: Upload File to B2.
### Aliases: b2UploadFile

### ** Examples

## Not run: 
##D # Make a bucket Private
##D # Get Upload URL
##D uploadUrlReturn <- b2GetUploadUrl(bucketId = "aUniqueBucketId")
##D uploadUrl <- uploadUrlReturn$uploadUrl
##D authToken <- uploadUrlReturn$authorizationToken
##D # Upload file
##D b2UploadFile(authToken, uploadUrl, fileName = "yourFileName.png")
## End(Not run)




