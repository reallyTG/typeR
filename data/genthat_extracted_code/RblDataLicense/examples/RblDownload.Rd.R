library(RblDataLicense)


### Name: RblDownload
### Title: Download a file from Bloomberg
### Aliases: RblDownload

### ** Examples

## Not run: 
##D # Run RblConnect first
##D RblRequest <- RblRequestBuilder(header = list(FIRMNAME = RblUser(), PROGRAMNAME = 'getdata'), 
##D                                 fields = c('PX_LAST'), identifiers = c('SXXE Index'))
##D req <- RblUpload(RblRequest)
##D out <- RblDownload(req$out)
##D out
## End(Not run)




