library(CUB)


### Name: inibestgama
### Title: Preliminary parameter estimates of a CUB model with covariates
###   for feeling
### Aliases: inibestgama
### Keywords: htest utilities

### ** Examples

data(univer)
m<-7; ordinal<-univer$global; cov<-univer$diploma
ini<-inibestgama(m,ordinal,W=cov)



