library(car)


### Name: testTransform
### Title: Likelihood-Ratio Tests for Univariate or Multivariate Power
###   Transformations to Normality
### Aliases: testTransform testTransform.powerTransform
###   testTransform.lmerModpowerTransform
###   testTransform.bcnPowerTransformlmer
### Keywords: regression

### ** Examples

summary(a3 <- powerTransform(cbind(len, adt, trks, sigs1) ~ htype, Highway1))
# test lambda = (0 0 0 -1)
testTransform(a3, c(0, 0, 0, -1))
summary(q1 <- powerTransform(lm(cbind(LoBD$I1L2, LoBD$I1L1) ~ pool, LoBD), family="bcnPower"))
testTransform(q1, c(.3, .8))




