library(tlm)


### Name: effect
### Title: Effects Estimate in Linear, Logistic and Poisson Regression
###   Models with Transformed Variables
### Aliases: effect print.effect
### Keywords: ~kwd1 ~kwd2

### ** Examples

### Linear model with log transformation in the response variable:
data(imt)
head(imt)

# model fitting:
modimt <- tlm(y = logimt, x = age, data = imt, ypow = 0)
modimt

# information on interpreting the effect:
effectInfo(modimt)

# the function effect provides as default the expected change in IMT
# for an additive change in age equal to the interquartile range:
effect(modimt)

# other effects:
(minage <- min(imt$age))
(maxage <- max(imt$age))
effect(modimt, c = maxage - minage)

## Not run: 
##D effect(modimt, x1 = minage, r = 50, npoints = 3)
## End(Not run)



