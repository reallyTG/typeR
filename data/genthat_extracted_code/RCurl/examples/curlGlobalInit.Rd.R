library(RCurl)


### Name: curlGlobalInit
### Title: Start and stop the Curl library
### Aliases: curlGlobalInit curlGlobalCleanup
### Keywords: IO

### ** Examples

    # Activate only the SSL.
 curlGlobalInit("ssl")

## Not run: 
##D # Don't run these automatically as we should only call this function
##D # once per R session
##D 
##D     # Everything, the default.
##D  curlGlobalInit()
##D 
##D    # Nothing.
##D  curlGlobalInit("none")
##D  curlGlobalInit(0)
## End(Not run)




