library(dataseries)


### Name: ds
### Title: Download Time Series from www.dataseries.org
### Aliases: ds cache_ls cache_rm

### ** Examples

## Not run: 
##D ds(c("CCI.AIK", "CCI.ASSS"))               # data.frame
##D ds(c("CCI.AIK", "CCI.ASSS"), "ts")         # "ts" object
##D ds(c("CCI.AIK", "CCI.ASSS"), "xts")        # "xts" object
##D 
##D # list cached objects
##D cache_ls()
##D 
##D # empty in-memory cache, which forces a fresh download
##D cache_rm()
## End(Not run)




