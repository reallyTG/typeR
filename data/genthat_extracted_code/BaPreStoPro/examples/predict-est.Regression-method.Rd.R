library(BaPreStoPro)


### Name: predict,est.Regression-method
### Title: Prediction for a regression model
### Aliases: predict,est.Regression-method

### ** Examples

t <- seq(0,1, by = 0.01)
cl <- set.to.class("Regression", fun = function(phi, t) phi[1]*t + phi[2],
                   parameter = list(phi = c(1,2), gamma2 = 0.1))
data <- simulate(cl, t = t)
est <- estimate(cl, t, data, 1000)
plot(est)
pred <- predict(est, fun.mat = function(phi, t) phi[,1]*t + phi[,2])
## Not run: 
##D pred2 <- predict(est, fun.mat = function(phi, t) phi[,1]*t + phi[,2], only.interval = FALSE)
##D plot(density(pred2[,10]))
## End(Not run)



