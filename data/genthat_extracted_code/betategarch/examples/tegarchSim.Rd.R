library(betategarch)


### Name: tegarchSim
### Title: Simulate from a first order Beta-Skew-t-EGARCH model
### Aliases: tegarchSim
### Keywords: Statistical Models

### ** Examples

##1-component specification: simulate series with 500 observations:
set.seed(123)
y <- tegarchSim(500, omega=0.01, phi1=0.9, kappa1=0.1, kappastar=0.05,
  df=10, skew=0.8)

##simulate the same series, but with more output (volatility, log-volatility or
##lambda, lambdadagger, u and epsilon)
set.seed(123)
y <- tegarchSim(500, omega=0.01, phi1=0.9, kappa1=0.1, kappastar=0.05, df=10, skew=0.8,
  verbose=TRUE)
  
##plot the simulated values:
plot(y)

##2-component specification: simulate series with 500 observations:
set.seed(123)
y <- tegarchSim(500, omega=0.01, phi1=0.95, phi2=0.9, kappa1=0.01, kappa2=0.05,
  kappastar=0.03, df=10, skew=0.8)



