library(funtimes)


### Name: mcusum.test
### Title: Change Point Test for Regression
### Aliases: mcusum.test
### Keywords: changepoint htest ts

### ** Examples

##### Model 1 with normal errors, by Horvath et al. (2017)
T <- 100 #length of time series
X <- rnorm(T, mean = 1, sd = 1)
E <- rnorm(T, mean = 0, sd = 1)
SizeOfChange <- 1.5
TimeOfChange <- 50
Y <- c(1 * X[1:TimeOfChange] + E[1:TimeOfChange], 
      (1 + SizeOfChange)*X[(TimeOfChange+1):T] + E[(TimeOfChange+1):T])
ehat <- lm(Y ~ X)$resid
mcusum.test(ehat, k = c(30, 50, 70))




