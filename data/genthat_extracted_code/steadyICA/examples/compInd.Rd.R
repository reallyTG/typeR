library(steadyICA)


### Name: compInd
### Title: Complete Measure of Mutual Multivariate Independence
### Aliases: compInd
### Keywords: distance covariance dcov

### ** Examples


library(steadyICA)
library(combinat)
set.seed(100)
S = matrix(rnorm(40),ncol=4)
group = c(1,2,3,3)
compInd(S,group,1)




