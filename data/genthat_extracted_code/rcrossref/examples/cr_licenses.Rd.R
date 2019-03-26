library(rcrossref)


### Name: cr_licenses
### Title: Search CrossRef licenses
### Aliases: cr_licenses cr_licenses_

### ** Examples

## Not run: 
##D cr_licenses()
##D # query for something, e.g. a publisher
##D cr_licenses(query = 'elsevier')
##D 
##D # Low level function - does no parsing to data.frame, get json or a list
##D cr_licenses_()
##D cr_licenses_(query = "elsevier")
##D cr_licenses_(query = "elsevier", parse=TRUE)
## End(Not run)



