library(FSA)


### Name: hoCoef
### Title: Performs a hypothesis test that a linear model parameter is
###   equal to a specific value.
### Aliases: hoCoef
### Keywords: htest

### ** Examples

# Simple linear regression test HA:slope!=0.1
lm1 <- lm(mirex~weight, data=Mirex)
hoCoef(lm1,2,0.1)




