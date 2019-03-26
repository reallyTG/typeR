library(AutoDeskR)


### Name: uploadFile
### Title: Upload a File to an App-Managed Bucket.
### Aliases: uploadFile

### ** Examples

## Not run: 
##D # Upload the "aerial.dwg" file to "mybucket"
##D resp <- uploadFile(file = system.file("inst/samples/aerial.dwg", package = "AutoDeskR"),
##D            token = myToken, bucket = "mybucket")
##D myUrn <- resp$content$objectId
## End(Not run)



