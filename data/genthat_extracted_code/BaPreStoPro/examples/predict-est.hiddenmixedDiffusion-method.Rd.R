library(BaPreStoPro)


### Name: predict,est.hiddenmixedDiffusion-method
### Title: Prediction for a hierarchical (mixed) hidden diffusion process
###   model
### Aliases: predict,est.hiddenmixedDiffusion-method

### ** Examples

mu <- c(5, 1); Omega <- c(0.9, 0.04)
phi <- cbind(rnorm(21, mu[1], sqrt(Omega[1])), rnorm(21, mu[2], sqrt(Omega[2])))
y0.fun <- function(phi, t) phi[2]
model <- set.to.class("hiddenmixedDiffusion", y0.fun = y0.fun,
     b.fun = function(phi, t, y) phi[1],
     parameter = list(phi = phi, mu = mu, Omega = Omega, gamma2 = 1, sigma2 = 0.01))
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t)

## Not run: 
##D est_hidmixdiff <- estimate(model, t, data$Z[1:20,], 200)
##D plot(est_hidmixdiff)
##D pred1 <- predict(est_hidmixdiff, b.fun.mat = function(phi, t, y) phi[,1])
##D pred2 <- predict(est_hidmixdiff, pred.alg = "Trajectory", b.fun.mat = function(phi, t, y) phi[,1])
##D pred3 <- predict(est_hidmixdiff, pred.alg = "simpleTrajectory", sample.length = nrow(pred1$Y))
##D lines(t, apply(pred1$Z, 2, quantile, 0.025), col = 3)
##D lines(t, apply(pred1$Z, 2, quantile, 0.975), col = 3)
##D lines(t, apply(pred2$Z, 2, quantile, 0.025), col = 4)
##D lines(t, apply(pred2$Z, 2, quantile, 0.975), col = 4)
##D pred4 <- predict(est_hidmixdiff, pred.alg = "simpleBayesTrajectory")
## End(Not run)



