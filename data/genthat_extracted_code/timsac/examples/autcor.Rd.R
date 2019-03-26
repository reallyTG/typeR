library(timsac)


### Name: autcor
### Title: Autocorrelation
### Aliases: autcor
### Keywords: ts

### ** Examples

# Example 1 for the normal distribution 
y <- rnorm(200)
autcor(y, lag_axis = FALSE)

# Example 2 for the ARIMA model
y <- arima.sim(list(order=c(2,0,0), ar=c(0.64,-0.8)), n = 200)
autcor(y, lag = 20)



