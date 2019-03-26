library(verification)


### Name: quantile2disc
### Title: Convert Continuous Forecast Values to Discrete Forecast Values.
### Aliases: quantile2disc
### Keywords: manip

### ** Examples

x <- rnorm(100)
bins <- quantile(x,seq(0,1,length.out=11))

newx <- quantile2disc(x,bins)




