library(GeneCycle)


### Name: is.constant
### Title: Simple Check for Constant Time Series
### Aliases: is.constant
### Keywords: ts

### ** Examples

# load GeneCycle library
library("GeneCycle")

# load data set
data(caulobacter)

# any constant genes?
sum(is.constant(caulobacter))

# but here:
series.1 <- rep(1, 10)
series.2 <- seq(1, 10)
is.constant( cbind(series.1, series.2) )




