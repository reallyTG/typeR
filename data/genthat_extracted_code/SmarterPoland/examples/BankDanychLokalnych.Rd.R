library(SmarterPoland)


### Name: Bank Danych Lokalnych
### Title: API to Bank Danych Lokalnych [GUS]
### Aliases: getBDLtree getBDLsearch getBDLseries getMPgminy getMPpowiaty
###   getMPwojewodztwa BDLtree
### Keywords: database

### ** Examples

## Not run: 
##D  # the data is downloaded and parsed from Internet
##D  # not that this dataset is pre-calculated in the package
##D  BDLtree <- getBDLtree(2)
##D  head(BDLtree)
##D 
##D  DBLtransport <- getBDLsearch("transport")
##D  head(DBLtransport)
##D 
##D  BDLseries <- getBDLseries(metric_id = 1)
##D  head(BDLseries)
##D 
##D  gminy <- getMPgminy()
##D  head(gminy)
##D 
##D  powiaty <- getMPpowiaty()
##D  head(powiaty)
## End(Not run)



