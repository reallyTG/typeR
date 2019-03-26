library(taxize)


### Name: ipni_search
### Title: Search for names in the International Plant Names Index (IPNI).
### Aliases: ipni_search

### ** Examples

## Not run: 
##D ipni_search(genus='Brintonia', isapnirecord=TRUE, isgcirecord=TRUE, isikrecord=TRUE)
##D head(ipni_search(genus='Ceanothus'))
##D head(ipni_search(genus='Pinus', species='contorta'))
##D 
##D # Different output formats
##D head(ipni_search(genus='Ceanothus'))
##D head(ipni_search(genus='Ceanothus', output='short'))
##D head(ipni_search(genus='Ceanothus', output='extended'))
## End(Not run)



