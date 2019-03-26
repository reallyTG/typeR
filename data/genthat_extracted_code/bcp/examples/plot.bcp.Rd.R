library(bcp)


### Name: plot.bcp
### Title: Plotting Bayesian change point results
### Aliases: plot.bcp
### Keywords: datasets

### ** Examples

testdata <- cbind( c(rnorm(50), rnorm(50, -5, 1), rnorm(50)),
c(rnorm(50), rnorm(50, 10.8, 1), rnorm(50, -3, 1)) )
bcp.0 <- bcp(testdata)
plot(bcp.0, main="Multivariate (k=2) Change Point Example")
plot(bcp.0, separated=TRUE, main="Multivariate (k=2) Change Point Example")




