library(coxsei)


### Name: coxseiest
### Title: Function to estimate the parametric part of the Cox
###   (proportional intensity) self-exciting point process (CoxSEI) model
### Aliases: coxseiest coxseiest2 coxseiest3
### Keywords: ~models ~regression ~survival

### ** Examples

data("dat")
## this takes over 15 minutes
##est0 <- coxseiest(dat,par.init=c(0.2,0.4,0.6,0.6,5))
## this one takes about 4 minutes
##est1 <- coxseiest2(dat,par.init=c(0.2,0.4,0.6,0.6,5))
## this one takes about 10 seconds
est2 <- coxseiest3(dat,par.init=c(0.2,0.4,0.6,0.6,5))



