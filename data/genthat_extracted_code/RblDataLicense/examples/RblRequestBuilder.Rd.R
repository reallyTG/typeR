library(RblDataLicense)


### Name: RblRequestBuilder
### Title: Build a request file to query Bloomberg
### Aliases: RblRequestBuilder

### ** Examples

## Not run: 
##D # Run RblConnect first
##D RblRequest <- RblRequestBuilder(header = list(FIRMNAME = RblUser(), PROGRAMNAME = 'getdata'), 
##D                                 fields = c('PX_LAST'), identifiers = c('SXXE Index'))
##D RblRequest
## End(Not run)




