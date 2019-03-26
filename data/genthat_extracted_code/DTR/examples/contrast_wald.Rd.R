library(DTR)


### Name: contrast_wald
### Title: Function to compare dynamic treatment regimes (DTRs) using
###   Wald-type tests
### Aliases: contrast_wald
### Keywords: survival analysis sequentially randomized clinical trial
###   sequentially randomized design treatment sequence dynamic treatment
###   regime adaptive treatment strategy Inverse weighting

### ** Examples

## Not run: 
##D # LDT estimates
##D data("LDTdata")
##D est <- LDTestimate(data=LDTdata)
##D contrast_wald(est, t=1)
##D 
##D # WRSE estimates
##D data("WRSEdata")
##D est <- WRSEestimate(data=WRSEdata)
##D contrast_wald(est, t=300)
## End(Not run)



