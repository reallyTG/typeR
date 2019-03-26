library(aTSA)


### Name: Holt
### Title: Holt's Two-parameter Exponential Smoothing
### Aliases: Holt

### ** Examples

x <- (1:100)/100
y <- 2 + 1.2*x + rnorm(100)

ho0 <- Holt(y) # with additive interaction
ho1 <- Holt(y,damped = TRUE) # with damped trend

# multiplicative model for AirPassengers data,
# although seasonal pattern exists.
ho2 <- Holt(AirPassengers,type = "multiplicative")



