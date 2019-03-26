library(localgauss)


### Name: localgauss.indtest
### Title: Pointwise Independence test based on local Gaussian correlation
### Aliases: localgauss.indtest
### Keywords: localgauss

### ** Examples

    x=rnorm(n=100)
    y=x^2 + rnorm(n=100)
    lgobj = localgauss(x,y,gsize=8)
    lgind = localgauss.indtest(lgobj)




