library(logcondens.mode)


### Name: LRmodeTest
### Title: Computes an Asymptotic Confidence Interval for the mode of a
###   Log-Concave Density
### Aliases: LRmodeTest
### Keywords: htest nonparametric

### ** Examples

nn <- 200
myxx <- rnorm(nn) ## no need to sort

## Under null/true hypothesis with or without grid
LRmodeTest(mode=0, x=myxx, xgrid=NULL, alpha=.05)
LRmodeTest(mode=0, x=myxx, xgrid=.05, alpha=.05)

## Under alternative/false hypothesis
LRmodeTest(mode=3, x=myxx, xgrid=NULL, alpha=.05)




