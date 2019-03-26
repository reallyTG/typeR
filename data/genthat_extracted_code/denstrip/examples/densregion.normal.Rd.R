library(denstrip)


### Name: densregion.normal
### Title: Density regions based on normal distributions
### Aliases: densregion.normal
### Keywords: aplot color

### ** Examples

## Time series forecasting

(fit <- arima(USAccDeaths, order = c(0,1,1),
              seasonal = list(order=c(0,1,1))))
pred <- predict(fit, n.ahead = 36)
plot(USAccDeaths, xlim=c(1973, 1982), ylim=c(5000, 15000))

## Compute normal forecast densities automatically (slow)

## Not run: 
##D densregion.normal(time(pred$pred), pred$pred, pred$se, 
##D                   pointwise=TRUE, colmax="darkgreen")
##D lines(pred$pred, lty=2)
##D lines(pred$pred + qnorm(0.975)*pred$se, lty=3)
##D lines(pred$pred - qnorm(0.975)*pred$se, lty=3)
## End(Not run)

## Compute forecast densities by hand (more efficient) 

nx <- length(pred$pred)
y <- seq(5000, 15000, by=100)
z <- matrix(nrow=nx, ncol=length(y))
for(i in 1:nx)
    z[i,] <- dnorm(y, pred$pred[i], pred$se[i])
plot(USAccDeaths, xlim=c(1973, 1982), ylim=c(5000, 15000))
densregion(time(pred$pred), y, z, colmax="darkgreen", pointwise=TRUE)
lines(pred$pred, lty=2)
lines(pred$pred + qnorm(0.975)*pred$se, lty=3)
lines(pred$pred - qnorm(0.975)*pred$se, lty=3)


densregion(time(pred$pred), y+2000, z, colmax="darkblue", pointwise=TRUE)



