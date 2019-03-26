library(SWMPr)


### Name: aggremetab
### Title: Aggregate metabolism data
### Aliases: aggremetab aggremetab.swmpr

### ** Examples

## Not run: 
##D ## import water quality and weather data
##D data(apadbwq)
##D data(apaebmet)
##D 
##D ## qaqc, combine
##D wq <- qaqc(apadbwq)
##D met <- qaqc(apaebmet)
##D dat <- comb(wq, met)
##D 
##D ## estimate metabolism
##D res <- ecometab(dat)
##D 
##D ## change aggregation period and alpha
##D aggremetab(res, by = 'months', alpha = 0.1)
##D 
##D ## use a moving window average of 30 days
##D aggremetab(res, by = 30)
##D 
##D ## use a left-centered window instead
##D aggremetab(res, by = 30, sides = 1)
## End(Not run)



