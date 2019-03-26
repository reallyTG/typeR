library(MLDS)


### Name: summary.mlds.bt
### Title: Method to Extract Bootstrap Values for MLDS Scale Values
### Aliases: summary.mlds.bt
### Keywords: methods

### ** Examples

data(kk1)
kk.mlds <- mlds(kk1)
kk.bt <- boot.mlds(kk.mlds, nsim = 10)
summary(kk.bt)




