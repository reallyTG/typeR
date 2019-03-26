library(rstudioapi)


### Name: versionInfo
### Title: RStudio Version Information
### Aliases: versionInfo

### ** Examples

## Not run: 
##D require(rstudioapi)
##D ver <- versionInfo()
##D 
##D # Test specific version constraint
##D if (ver$version >= "0.97") {
##D    # do some 0.97 dependent stuff
##D }
##D 
##D # Check current mode
##D desktopMode <- ver$mode == "desktop"
##D serverMode <- ver$mode == "server"
##D 
##D # Get the citation
##D ver$citation
##D 
## End(Not run)




