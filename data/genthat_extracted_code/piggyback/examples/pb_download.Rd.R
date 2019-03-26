library(piggyback)


### Name: pb_download
### Title: Download data from an existing release
### Aliases: pb_download

### ** Examples

## No test: 
 ## Download a specific file.
 ## (dest can be omitted when run inside and R project)
 piggyback::pb_download("data/iris.tsv.gz",
                        repo = "cboettig/piggyback-tests",
                        dest = tempdir())
## End(No test)
## Not run: 
##D  ## Download all files
##D  piggyback::pb_download(repo = "cboettig/piggyback-tests",
##D                         dest = tempdir())
##D 
## End(Not run)



