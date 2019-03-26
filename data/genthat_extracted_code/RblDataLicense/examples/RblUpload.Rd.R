library(RblDataLicense)


### Name: RblUpload
### Title: Upload a request file to Bloomberg
### Aliases: RblUpload

### ** Examples

## Not run: 
##D # Run RblConnect first
##D RblRequest <- RblRequestBuilder(header = list(FIRMNAME = RblUser(), PROGRAMNAME = 'getdata'), 
##D                                 fields = c('PX_LAST'), identifiers = c('SXXE Index'))
##D req <- RblUpload(RblRequest)
##D req
## End(Not run)




