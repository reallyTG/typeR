library(DAKS)


### Name: variance
### Title: Estimated Asymptotic Variance
### Aliases: variance
### Keywords: htest manip math models multivariate univar utilities

### ** Examples

x <- simu(5, 100, 0.05, 0.05, delta = 0.15)
variance(x$dataset, x$implications, v = 2)



