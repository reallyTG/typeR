library(lognorm)


### Name: getLognormMoments
### Title: getLognormMoments
### Aliases: getLognormMoments

### ** Examples

# start by estimating lognormal parameters from moments
.mean <- 1
.var <- c(1.3,2)^2
parms <- getParmsLognormForMoments(.mean, .var)
#
# computed moments must equal previous ones
(ans <- getLognormMoments(parms[,"mu"], parms[,"sigma"]))
cbind(.var, ans[,"var"])



