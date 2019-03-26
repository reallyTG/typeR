library(IPWboxplot)


### Name: IPW.quantile
### Title: Computes the IPW quantiles
### Aliases: IPW.quantile
### Keywords: quantile missing inverse probability weighted

### ** Examples




## A real data example
library(mice)
data(boys)
attach(boys)
# As an illustration, we consider variable testicular volume, tv.
# To compute the inverse probability weighted (IPW) quartiles
# the covariate age is considered as covariate with predictive capability
# to estimate the vector of drop-out probabilities.

res=IPW.quantile(tv,x=age,probs=c(0.25,0.5,0.75))
res$IPW.quantile

# Compute the inverse probability weighted (IPW) quantiles
# corresponding to the fractiles  0.3, 0.8 and 0.9
# using the covariate age  to estimate the propensity.


res1=IPW.quantile(tv,x=age,probs=c(0.3,0.8,0.9))
res1$IPW.quantile




