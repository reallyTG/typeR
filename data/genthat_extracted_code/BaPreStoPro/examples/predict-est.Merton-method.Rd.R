library(BaPreStoPro)


### Name: predict,est.Merton-method
### Title: Prediction for a jump diffusion process
### Aliases: predict,est.Merton-method

### ** Examples

cl <- set.to.class("Merton",
               parameter = list(thetaT = 0.1, phi = 0.05, gamma2 = 0.1, xi = c(3, 1/4)),
               Lambda = function(t, xi) (t/xi[2])^xi[1])
t <- seq(0, 1, by = 0.01)
data <- simulate(cl, t = t, y0 = 0.5)
est <- estimate(cl, t, data, 1000)
plot(est)
## Not run: 
##D pred1 <- predict(est, Lambda.mat = function(t, xi) (t/xi[,2])^xi[,1])
##D pred2 <- predict(est, Lambda.mat = function(t, xi) (t/xi[,2])^xi[,1], pred.alg = "Trajectory")
##D pred3 <- predict(est, pred.alg = "simpleTrajectory")
##D pred4 <- predict(est, pred.alg = "simpleBayesTrajectory")
## End(Not run)



