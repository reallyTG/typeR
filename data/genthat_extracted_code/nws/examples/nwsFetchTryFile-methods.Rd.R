library(nws)


### Name: nwsFetchTryFile
### Title: Fetch a Stored Value and Write It to a File
### Aliases: nwsFetchTryFile nwsFetchTryFile-methods
###   nwsFetchTryFile,netWorkSpace-method
### Keywords: methods

### ** Examples

## Not run: 
##D ws <- netWorkSpace('nws example')
##D nwsStore(ws, 'x', 'Hello, world\n')
##D if (nwsFetchTryFile(ws, 'x', 'hello.txt')) {
##D   cat('success\n')
##D } else {
##D   cat('failure\n')
##D }
## End(Not run)



