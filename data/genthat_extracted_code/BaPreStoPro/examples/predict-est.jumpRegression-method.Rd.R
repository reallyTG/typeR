library(BaPreStoPro)


### Name: predict,est.jumpRegression-method
### Title: Prediction for a regression model dependent on a Poisson process
### Aliases: predict,est.jumpRegression-method

### ** Examples

t <- seq(0,1, by = 0.01)
cl <- set.to.class("jumpRegression", fun = function(t, N, theta) theta[1]*t + theta[2]*N,
             parameter = list(theta = c(1,2), gamma2 = 0.1, xi = c(3, 1/4)),
             Lambda = function(t, xi) (t/xi[2])^xi[1])
data <- simulate(cl, t = t)
est <- estimate(cl, t, data, 1000)
plot(est)
## Not run: 
##D pred <- predict(est, Lambda.mat = function(t, xi) (t/xi[,2])^xi[,1],
##D                  fun.mat = function(t, N, theta) theta[,1]*t + theta[,2]*N)
## End(Not run)
pred <- predict(est, pred.alg = "simpleTrajectory", sample.length = 100)



