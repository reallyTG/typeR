library(statmod)


### Name: mixedModel2
### Title: Fit Mixed Linear Model with 2 Error Components
### Aliases: mixedModel2 mixedModel2Fit randomizedBlock randomizedBlockFit
### Keywords: regression

### ** Examples

#  Compare with first data example from Venable and Ripley (2002),
#  Chapter 10, "Linear Models"
library(MASS)
data(petrol)
out <- mixedModel2(Y~SG+VP+V10+EP, random=No, data=petrol)
cbind(varcomp=out$varcomp,se=out$se.varcomp)



