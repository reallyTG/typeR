library(easyCODA)


### Name: invALR
### Title: Inverse of additive logratios
### Aliases: invALR
### Keywords: logratio

### ** Examples

data(veg)
# compute additive logratios with respect to second part
veg.ALR <- ALR(veg, denom=2)$LR
# recover original parts (to get same order, specify the denominator used originally)
invALR(veg.ALR, denom=2)



