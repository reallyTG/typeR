library(spaMM)


### Name: vcov
### Title: Extract covariance or correlation matrices from a fitted model
###   object
### Aliases: beta_table vcov vcov.HLfit Corr

### ** Examples

data("wafers")
m1 <- HLfit(y ~X1+X2+(1|batch),
          resid.model = ~ 1 ,data=wafers,HLmethod="ML")
vcov(m1)



