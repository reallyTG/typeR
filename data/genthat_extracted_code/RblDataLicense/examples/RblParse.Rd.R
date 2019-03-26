library(RblDataLicense)


### Name: RblParse
### Title: Parse Bloomberg response file and fetch data
### Aliases: RblParse

### ** Examples

## Not run: 
##D # Run RblConnect first
##D RblRequest <- RblRequestBuilder(header = list(FIRMNAME = RblUser(), PROGRAMNAME = 'getdata'), 
##D                                 fields = c('PX_LAST'), identifiers = c('SXXE Index'))
##D req <- RblUpload(RblRequest)
##D out <- RblDownload(req$out)
##D data <- RblParse(d)
##D data
## End(Not run)




