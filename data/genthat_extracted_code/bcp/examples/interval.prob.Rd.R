library(bcp)


### Name: interval.prob
### Title: Estimate the probability of a change point in a specified
###   interval
### Aliases: interval.prob
### Keywords: datasets

### ** Examples

##### A random sample from a few normal distributions #####
testdata <- c(rnorm(50), rnorm(50, 5, 1), rnorm(50))
bcp.0 <- bcp(testdata, return.mcmc=TRUE)
plot(bcp.0, main="Univariate Change Point Example")
interval.prob(bcp.0, 45, 55)




