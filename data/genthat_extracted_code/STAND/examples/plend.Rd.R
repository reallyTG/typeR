library(STAND)


### Name: plend
### Title: Compute Product Limit Estimate for Non-detects
### Aliases: plend
### Keywords: nonparametric

### ** Examples

data(SESdata) #  use SESdata data set Example 1 from ORNLTM-2005/52
pnd<- plend(SESdata)
Ia<-"Q-Q plot For SESdata "
qq.lnorm(pnd,main=Ia) #  lognormal q-q plot based on PLE 
pnd



