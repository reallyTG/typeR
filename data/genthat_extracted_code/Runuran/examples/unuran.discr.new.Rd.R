library(Runuran)


### Name: unuran.discr.new
### Title: Create a UNU.RAN discrete univariate distribution object
### Aliases: unuran.discr.new
### Keywords: distribution datagen

### ** Examples

## Create a distribution object with given PV and mode
mypv <- dbinom(0:100,100,0.3)
distr <- new("unuran.discr", pv=mypv, lb=0, mode=30)

## Create discrete distribution with given probability vector
## (the PV need not be normalized)
pv <- c(1.,2.,1.5,0.,3.,1.2)     
dpv <- new("unuran.discr", pv=pv, lb=1)

## Create discrete distribution with given PMF
pmf <- function(x) dbinom(x,100,0.3)
dpmf <- new("unuran.discr", pmf=pmf, lb=0, ub=100)




