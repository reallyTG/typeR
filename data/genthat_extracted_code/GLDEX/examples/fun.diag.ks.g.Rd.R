library(GLDEX)


### Name: fun.diag.ks.g
### Title: Compute the simulated Kolmogorov-Smirnov tests for the unimodal
###   dataset
### Aliases: fun.diag.ks.g
### Keywords: htest

### ** Examples

## Generate 1000 random observations from Normal distribution with mean=100, 
## standard deviation=10. Save this as junk
# junk<-rnorm(1000,100,10)

## Fit junk using RPRS method via the maxmum likelihood.
# fit1<-fun.RPRS.ml(junk, c(-1.5, 1.5), leap = 3)

## Calculate the simulated KS test result:
# fun.diag.ks.g(fit1,junk,param="rs")



