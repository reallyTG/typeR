library(timeSeries)


### Name: scale
### Title: scale
### Keywords: chron

### ** Examples
   
## Load Series:
   x <- 100* LPP2005REC[, c("SBI", "SPI")]
   
## Scale and Center -
   X <- scale(x)
   hist(X[, 1], prob=TRUE)
   s <- seq(-3, 3, length=201)
   lines(s, dnorm(s), col="red")  



