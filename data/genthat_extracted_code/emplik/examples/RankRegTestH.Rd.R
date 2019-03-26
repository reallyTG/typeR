library(emplik)


### Name: RankRegTestH
### Title: Test the AFT model, Rank Regression estimator by
###   (Hazard)Empirical Likelihood
### Aliases: RankRegTestH
### Keywords: nonparametric htest

### ** Examples

data(myeloma)
RankRegTestH(y=myeloma[,1], d=myeloma[,2], x=myeloma[,3], beta= -15.50147)
# you should get "-2LLR" = 9.050426e-05 (practically zero)
# The beta value, -15.50147, was obtained by rankaft() from 
# the rankreg package.



