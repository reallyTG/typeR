library(emplik)


### Name: RankRegTest
### Title: Test the AFT model Rank Regression estimator by Empirical
###   Likelihood
### Aliases: RankRegTest
### Keywords: nonparametric htest

### ** Examples

data(myeloma)
RankRegTest(y=myeloma[,1], d=myeloma[,2], x=myeloma[,3], beta= -15.50147)
# you should get "-2LLR" = 9.050426e-05 (practically zero)
# The beta value, -15.50147, was obtained by rankaft() from the rankreg package.



