library(preseqR)


### Name: ztnb.rSAC
### Title: ZTNB estimator
### Aliases: ztnb.rSAC
### Keywords: estimator, r-SAC, parametric, negative binomial

### ** Examples

## load library
library(preseqR)

## import data
data(FisherButterfly)

## construct the estimator for SAC
ztnb1 <- ztnb.rSAC(FisherButterfly, r=1)
## The number of species represented at least once in a sample, 
## when the sample size is 10 or 20 times of the initial sample
ztnb1(c(10, 20))

## construct the estimator for r-SAC
ztnb2 <- ztnb.rSAC(FisherButterfly, r=2)
## The number of species represented at least twice in a sample, 
## when the sample size is 50 or 100 times of the initial sample
ztnb2(c(50, 100))



