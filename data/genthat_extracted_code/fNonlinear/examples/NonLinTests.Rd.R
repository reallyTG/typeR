library(fNonlinear)


### Name: NonLinTests
### Title: Time Series Tests
### Aliases: NonLinTests tsTest bdsTest tnnTest wnnTest runsTest
### Keywords: htest

### ** Examples

## bdsTest -
   # iid Time Series:
   par(mfrow = c(3, 1))
   x = rnorm(100)
   plot(x, type = "l", main = "iid Time Series")
   bdsTest(x, m = 3)
   # Non Identically Distributed Time Series:
   x = c(rnorm(50), runif(50))
   plot(x, type = "l", main = "Non-iid Time Series")
   bdsTest(x, m = 3)  
   # Non Independent Innovations from Quadratic Map:
   x = rep(0.2, 100)
   for (i in 2:100) x[i] = 4*(1-x[i-1])*x[i-1]
   plot(x, type = "l", main = "Quadratic Map")
   bdsTest(x, m = 3)
   
## tnnTest -
   # Time Series Non-linear in "mean" regression 
   par(mfrow = c(2, 1))
   n = 1000
   x = runif(1000, -1, 1)  
   tnnTest(x)
   # Generate time series which is nonlinear in "mean"
   x[1] = 0.0
   for (i in (2:n)) {
     x[i] = 0.4*x[i-1] + tanh(x[i-1]) + rnorm (1, sd = 0.5) }
   plot(x, main = "Teraesvirta Test", type = "l")
   tnnTest(x)
   
## wnnTest -
   # Time Series Non-Linear in "mean" Regression
   par(mfrow = c(2, 1))
   n = 1000
   x = runif(1000, -1, 1)
   wnnTest(x)
   # Generate time series which is nonlinear in "mean"
   x[1] = 0.0
   for (i in (2:n)) {
     x[i] = 0.4*x[i-1] + tanh(x[i-1]) + rnorm (1, sd = 0.5) }
   plot(x, main = "White Test", type = "l")
   wnnTest(x)                     



