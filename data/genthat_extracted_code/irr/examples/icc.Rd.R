library(irr)


### Name: icc
### Title: Intraclass correlation coefficient (ICC) for oneway and twoway
###   models
### Aliases: icc
### Keywords: univar

### ** Examples

data(anxiety)
icc(anxiety, model="twoway", type="agreement")

r1 <- round(rnorm(20, 10, 4))
r2 <- round(r1 + 10 + rnorm(20, 0, 2))
r3 <- round(r1 + 20 + rnorm(20, 0, 2))
icc(cbind(r1, r2, r3), "twoway")              # High consistency
icc(cbind(r1, r2, r3), "twoway", "agreement") # Low agreement



