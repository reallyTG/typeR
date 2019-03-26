library(Runuran)


### Name: unuran.discr-class
### Title: Class "unuran.discr" for Discrete Distribution
### Aliases: unuran.discr-class print,unuran.discr-method
###   show,unuran.discr-method initialize,unuran.discr-method
### Keywords: classes distribution datagen

### ** Examples

## Create discrete distribution with given probability vector
## (the PV need not be normalized)
pv <- c(1.,2.,1.5,0.,3.,1.2)     
dpv <- new("unuran.discr", pv=pv, lb=1)

## Create discrete distribution with given PMF
pmf <- function(x) dbinom(x,100,0.3)
dpmf <- new("unuran.discr",pmf=pmf,lb=0,ub=100)




