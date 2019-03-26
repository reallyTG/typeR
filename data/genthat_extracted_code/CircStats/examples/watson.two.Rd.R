library(CircStats)


### Name: watson.two
### Title: Watson's Two-Sample Test of Homogeneity
### Aliases: watson.two
### Keywords: htest

### ** Examples

# Perform a two-sample test of homogeneity on two
# simulated data sets.
data1 <- rvm(20, 0, 3)
data2 <- rvm(20, pi, 2)
watson.two(data1, data2, alpha=0.05, plot=TRUE)
watson.two(data1, data2)



