library(europepmc)


### Name: epmc_hits_trend
### Title: Get the yearly number of hits for a query and the total yearly
###   number of hits for a given period
### Aliases: epmc_hits_trend

### ** Examples

## Not run: 
##D # aspirin as query
##D epmc_hits_trend('aspirin', period = 2006:2016, synonym = FALSE)
##D # link to cran packages in reference lists
##D epmc_hits_trend('REF:"cran.r-project.org*"', period = 2006:2016, synonym = FALSE)
##D # more complex with publication type review
##D epmc_hits_trend('(REF:"cran.r-project.org*") AND (PUB_TYPE:"Review" OR PUB_TYPE:"review-article")',
##D   period = 2006:2016, synonym = FALSE)
## End(Not run)



