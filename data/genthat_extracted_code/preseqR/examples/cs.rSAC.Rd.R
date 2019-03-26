library(preseqR)


### Name: cs.rSAC
### Title: CS estimator
### Aliases: cs.rSAC
### Keywords: estimator, r-SAC, nonparametric

### ** Examples

## load library
library(preseqR)

## import data
data(FisherButterfly)

## construct the estimator for SAC
chao1 <- cs.rSAC(FisherButterfly, r=1)
## The number of species represented at least once in a sample, 
## when the sample size is 10 or 20 times of the initial sample
chao1(c(10, 20))

## construct the estimator for r-SAC
chao2 <- cs.rSAC(FisherButterfly, r=2)
## The number of species represented at least twice in a sample, 
## when the sample size is 50 or 100 times of the initial sample
chao2(c(50, 100))



