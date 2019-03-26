library(preseqR)


### Name: bbc.rSAC
### Title: BBC estimator
### Aliases: bbc.rSAC
### Keywords: estimator, r-SAC, nonparametric

### ** Examples

## load library
library(preseqR)

## import data
data(FisherButterfly)

## construct the estimator for SAC
bbc1 <- bbc.rSAC(FisherButterfly, r=1)
## The number of species represented at least once in a sample, 
## when the sample size is 10 or 20 times of the initial sample
bbc1(c(10, 20))

## construct the estimator for r-SAC
bbc2 <- bbc.rSAC(FisherButterfly, r=2)
## The number of species represented at least twice in a sample, 
## when the sample size is 50 or 100 times of the initial sample
bbc2(c(50, 100))



