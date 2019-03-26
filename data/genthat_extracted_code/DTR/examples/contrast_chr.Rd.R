library(DTR)


### Name: contrast_chr
### Title: Function to compare dynamic treatment regimes (DTRs) based on
###   cumulative hazard ratios (CHRs)
### Aliases: contrast_chr
### Keywords: survival analysis sequentially randomized clinical trial
###   sequentially randomized design treatment sequence dynamic treatment
###   regime adaptive treatment strategy Inverse weighting

### ** Examples

## Not run: 
##D data("CHRdata")
##D est <- CHRestimate(data=CHRdata, covar="V1")
##D contrast_chr(est, t=1.5)
## End(Not run)



