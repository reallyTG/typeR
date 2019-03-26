library(taxize)


### Name: gni_details
### Title: Search for taxonomic name details using the Global Names Index.
### Aliases: gni_details
### Keywords: globalnamesindex names taxonomy

### ** Examples

## Not run: 
##D gni_details(id = 17802847)
##D library("plyr")
##D ldply(list(1265133, 17802847), gni_details)
##D 
##D # pass on curl options to httr
##D library("httr")
##D gni_details(id = 17802847, config = verbose())
## End(Not run)



