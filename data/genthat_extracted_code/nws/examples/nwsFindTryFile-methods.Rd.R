library(nws)


### Name: nwsFindTryFile
### Title: Find a Stored Value and Write It to a File
### Aliases: nwsFindTryFile nwsFindTryFile-methods
###   nwsFindTryFile,netWorkSpace-method
### Keywords: methods

### ** Examples

## Not run: 
##D ws <- netWorkSpace('nws example')
##D nwsStore(ws, 'x', 'Hello, world\n')
##D if (nwsFindTryFile(ws, 'x', 'hello.txt')) {
##D   cat('success\n')
##D } else {
##D   cat('failure\n')
##D }
## End(Not run)



