library(tseries)


### Name: portfolio.optim
### Title: Portfolio Optimization
### Aliases: portfolio.optim portfolio.optim.ts portfolio.optim.default
### Keywords: ts

### ** Examples

x <- rnorm(1000)
dim(x) <- c(500,2)
res <- portfolio.optim(x)
res$pw

require("zoo")			# For diff() method.
X <- diff(log(as.zoo(EuStockMarkets)))
res <- portfolio.optim(X)                 ## Long only
res$pw
res <- portfolio.optim(X, shorts=TRUE)    ## Long/Short
res$pw



