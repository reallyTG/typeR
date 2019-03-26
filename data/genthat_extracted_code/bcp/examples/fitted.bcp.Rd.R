library(bcp)


### Name: fitted.bcp
### Title: Extract model fitted values
### Aliases: fitted.bcp
### Keywords: datasets

### ** Examples

##### A random sample from a few normal distributions #####
testdata <- c(rnorm(50), rnorm(50, 5, 1), rnorm(50))
bcp.0 <- bcp(testdata)
residuals(bcp.0)




