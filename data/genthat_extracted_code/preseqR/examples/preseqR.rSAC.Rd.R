library(preseqR)


### Name: preseqR.rSAC
### Title: Best practice for r-SAC - a fast version
### Aliases: preseqR.rSAC
### Keywords: estimator, r-SAC, RFA, ZTNB, best practice

### ** Examples

## load library
library(preseqR)

## import data
data(FisherButterfly)

## construct the estimator for SAC
estimator1 <- preseqR.rSAC(FisherButterfly, r=1)
## The number of species represented at least once in a sample, 
## when the sample size is 10 or 20 times of the initial sample
estimator1(c(10, 20))

## construct the estimator for r-SAC
estimator2 <- preseqR.rSAC(FisherButterfly, r=2)
## The number of species represented at least twice in a sample, 
## when the sample size is 50 or 100 times of the initial sample
estimator2(c(50, 100))



