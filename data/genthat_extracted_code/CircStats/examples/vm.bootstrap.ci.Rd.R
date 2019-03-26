library(CircStats)


### Name: vm.bootstrap.ci
### Title: Bootstrap Confidence Intervals
### Aliases: vm.bootstrap.ci
### Keywords: htest

### ** Examples

x <- rvm(25, 0, 3)
x.bs <- vm.bootstrap.ci(x, alpha=.10)
hist(x.bs$kappa.reps)



