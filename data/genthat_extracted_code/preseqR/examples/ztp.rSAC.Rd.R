library(preseqR)


### Name: ztp.rSAC
### Title: ZTP estimator
### Aliases: ztp.rSAC
### Keywords: estimator, r-SAC, parametric, Poisson

### ** Examples

## load library
library(preseqR)

## import data
data(FisherButterfly)

## construct the estimator for SAC
ztp1 <- ztp.rSAC(FisherButterfly, r=1)
## The number of species represented at least once in a sample, 
## when the sample size is 10 or 20 times of the initial sample
ztp1(c(10, 20))

## construct the estimator for r-SAC
ztp2 <- ztp.rSAC(FisherButterfly, r=2)
## The number of species represented at least once in a sample, 
## when the sample size is 10 or 20 times of the initial sample
ztp2(c(50, 100))



