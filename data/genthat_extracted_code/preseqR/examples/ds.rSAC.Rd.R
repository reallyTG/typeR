library(preseqR)


### Name: ds.rSAC
### Title: RFA estimator
### Aliases: ds.rSAC
### Keywords: estimator, r-SAC, RFA, nonparametric

### ** Examples

## load library
library(preseqR)

## import data
data(FisherButterfly)

## construct the estimator for SAC
ds1 <- ds.rSAC(FisherButterfly, r=1)
## The number of species represented at least once in a sample, 
## when the sample size is 10 or 20 times of the initial sample
ds1(c(10, 20))

## construct the estimator for r-SAC
ds2 <- ds.rSAC(FisherButterfly, r=2)
## The number of species represented at least twice in a sample, 
## when the sample size is 50 or 100 times of the initial sample
ds2(c(50, 100))



