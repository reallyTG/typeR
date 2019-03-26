library(CPBayes)


### Name: estimate_corln
### Title: Estimate correlation structure of beta-hat vector for multiple
###   overlapping case-control studies using sample-overlap matrices.
### Aliases: estimate_corln

### ** Examples

data(SampleOverlapMatrix)
n11 <- SampleOverlapMatrix$n11
n11
n00 <- SampleOverlapMatrix$n00
n00
n10 <- SampleOverlapMatrix$n10
n10
cor <- estimate_corln(n11, n00, n10)
cor




