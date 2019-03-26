library(STAND)


### Name: plekm
### Title: Product Limit Estimate for Non-detects Using Kaplan-Meier
### Aliases: plekm
### Keywords: survival

### ** Examples


data(SESdata) ## use SESdata data set Example 1 from ORNLTM-2005/52
pkm<- plekm(SESdata)
qq.lnorm(pkm) #  lognormal q-q plot based on PLE
round(pkm,3)




