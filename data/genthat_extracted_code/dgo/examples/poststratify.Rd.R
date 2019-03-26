library(dgo)


### Name: poststratify
### Title: Reweight and aggregate estimates
### Aliases: poststratify poststratify,dgo_fit-method
###   poststratify,data.frame-method

### ** Examples

## Not run: 
##D data(toy_dgirtfit)
##D 
##D # the stratifying variables should uniquely identify proportions in the
##D # target data; to achieve this, sum over the other variables
##D targets <- aggregate(proportion ~ state + year + race3, targets, sum)
##D 
##D # the dgirtfit method of poststratify takes a dgirtfit object, the target
##D # data, the names of variables that define population strata, and the  names
##D # of variables to be aggregated over
##D post <- poststratify(toy_dgirtfit, targets, c("state", "year"), "race3")
## End(Not run)



