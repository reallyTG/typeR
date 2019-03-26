library(hetGP)


### Name: mleHomGP
### Title: Gaussian process modeling with homoskedastic noise
### Aliases: mleHomGP

### ** Examples

##------------------------------------------------------------
## Example 1: Homoskedastic GP modeling on the motorcycle data
##------------------------------------------------------------
set.seed(32)

## motorcycle data
library(MASS)
X <- matrix(mcycle$times, ncol = 1)
Z <- mcycle$accel
plot(X, Z, ylim = c(-160, 90), ylab = 'acceleration', xlab = "time")

 
model <- mleHomGP(X = X, Z = Z, lower = 0.01, upper = 100)
  
## Display averaged observations
points(model$X0, model$Z0, pch = 20) 
xgrid <- matrix(seq(0, 60, length.out = 301), ncol = 1) 
predictions <- predict(x = xgrid, object =  model)

## Display mean prediction
lines(xgrid, predictions$mean, col = 'red', lwd = 2)
## Display 95% confidence intervals
lines(xgrid, qnorm(0.05, predictions$mean, sqrt(predictions$sd2)), col = 2, lty = 2)
lines(xgrid, qnorm(0.95, predictions$mean, sqrt(predictions$sd2)), col = 2, lty = 2)
## Display 95% prediction intervals
lines(xgrid, qnorm(0.05, predictions$mean, sqrt(predictions$sd2 + predictions$nugs)), 
  col = 3, lty = 2)
lines(xgrid, qnorm(0.95, predictions$mean, sqrt(predictions$sd2 + predictions$nugs)), 
  col = 3, lty = 2)



