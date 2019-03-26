library(bcp)


### Name: legacyplot
### Title: Plotting univariate Bayesian change point results
### Aliases: legacyplot
### Keywords: datasets

### ** Examples

##### A random sample from a few normal distributions #####
testdata <- c(rnorm(50), rnorm(50, 5, 1), rnorm(50))
bcp.0 <- bcp(testdata, return.mcmc=TRUE)
legacyplot(bcp.0)




