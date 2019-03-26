library(circular)


### Name: watson.two.test
### Title: Watson's Two-Sample Test of Homogeneity
### Aliases: watson.two.test print.watson.two.test
### Keywords: htest

### ** Examples

# Perform a two-sample test of homogeneity on two
# simulated data sets.
data1 <- rvonmises(n=20, mu=circular(0), kappa=3)
data2 <- rvonmises(n=20, mu=circular(pi), kappa=2)
watson.two.test(data1, data2, alpha=0.05)
watson.two.test(data1, data2)



