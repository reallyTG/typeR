library(preseqR)


### Name: fisher.rSAC
### Title: Logseries estimator
### Aliases: fisher.rSAC
### Keywords: estimator, r-SAC, parametric

### ** Examples

## load library
library(preseqR)

## import data
data(WillButterfly)

## construct the estimator for SAC
fisher1 <- fisher.rSAC(WillButterfly, r=1)
## The number of species represented at least once in a sample, 
## when the sample size is 10 or 20 times of the initial sample
fisher1(c(10, 20))

## construct the estimator for r-SAC
fisher2 <- fisher.rSAC(WillButterfly, r=2)
## The number of species represented at least twice in a sample, 
## when the sample size is 50 or 100 times of the initial sample
fisher2(c(50, 100))



