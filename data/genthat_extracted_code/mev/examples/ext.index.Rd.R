library(mev)


### Name: ext.index
### Title: Extremal index estimators based on interexceedance time and gap
###   of exceedances
### Aliases: ext.index

### ** Examples

set.seed(234)
#Moving maxima model with theta=0.5
a <- 1; theta <-  1/(1+a)
sim <- evd::rgev(10001, loc=1/(1+a),scale=1/(1+a),shape=1)
x <- pmax(sim[-length(sim)]*a,sim[-1])
q <- seq(0.9,0.99,by=0.01)
ext.index(x=x,q=q,method=c("wls","mle"))



