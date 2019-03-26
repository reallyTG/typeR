library(BaPreStoPro)


### Name: predict,est.mixedDiffusion-method
### Title: Prediction for a hierarchical (mixed) diffusion process model
### Aliases: predict,est.mixedDiffusion-method

### ** Examples

mu <- 2; Omega <- 0.4; phi <- matrix(rnorm(21, mu, sqrt(Omega)))
model <- set.to.class("mixedDiffusion",
         parameter = list(phi = phi, mu = mu, Omega = Omega, gamma2 = 0.1),
         b.fun = function(phi, t, x) phi*x, sT.fun = function(t, x) x)
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t)
est_mixdiff <- estimate(model, t, data[1:20,], 100) # nMCMC should be much larger
plot(est_mixdiff)
## Not run: 
##D pred_mixdiff <- predict(est_mixdiff, b.fun.mat = function(phi, t, y) phi[,1]*y)
##D lines(t, data[21,], lwd = 2)
##D mean(apply(pred_mixdiff$Y, 2, quantile, 0.025) <= data[21, ] &
##D apply(pred_mixdiff$Y, 2, quantile, 0.975) >= data[21, ])
##D mean(sapply(1:20, function(i){
##D    mean(apply(pred_mixdiff$Y, 2, quantile, 0.025) <= data[i, ] &
##D    apply(pred_mixdiff$Y, 2, quantile, 0.975) >= data[i, ])}))
##D pred_mixdiff2 <- predict(est_mixdiff, b.fun.mat = function(phi, t, y) phi[,1]*y,
##D      which.series = "current")
##D pred_mixdiff3 <- predict(est_mixdiff, b.fun.mat = function(phi, t, y) phi[,1]*y,
##D      which.series = "current", y.start = data[20, 51], t = t[51:101])
## End(Not run)
pred_mixdiff <- predict(est_mixdiff, Euler.interval = TRUE,
     b.fun.mat = function(phi, t, y) phi[,1]*y); lines(t, data[21,], lwd = 2)
     # one step Euler approximation
pred_mixdiff <- predict(est_mixdiff, pred.alg = "simpleTrajectory",
                        sample.length = 100)
for(i in 1:100) lines(t, pred_mixdiff$Y[i,], col = "grey")
pred_mixdiff <- predict(est_mixdiff, pred.alg = "simpleBayesTrajectory")

# OU
## Not run: 
##D b.fun <- function(phi, t, y) phi[1]-phi[2]*y; y0.fun <- function(phi, t) phi[3]
##D mu <- c(10, 1, 0.5); Omega <- c(0.9, 0.01, 0.01)
##D phi <- sapply(1:3, function(i) rnorm(21, mu[i], sqrt(Omega[i])))
##D model <- set.to.class("mixedDiffusion",
##D            parameter = list(phi = phi, mu = mu, Omega = Omega, gamma2 = 0.1),
##D            y0.fun = y0.fun, b.fun = b.fun, sT.fun = function(t, x) 1)
##D t <- seq(0, 1, by = 0.01)
##D data <- simulate(model, t = t)
##D est <- estimate(model, t, data[1:20,], 2000)
##D plot(est)
##D pred <- predict(est, t = seq(0, 1, length = 21),
##D    b.fun.mat = function(phi, t, y) phi[,1]-phi[,2]*y)
##D lines(t, data[21,], lwd = 2)
##D mean(apply(pred$Y, 2, quantile, 0.025) <= data[21, seq(1, length(t), length = 21)] &
##D      apply(pred$Y, 2, quantile, 0.975) >= data[21, seq(1, length(t), length = 21)])
##D mean(sapply(1:20, function(i){
##D     mean(apply(pred$Y, 2, quantile, 0.025) <= data[i, seq(1, length(t), length = 21)] &
##D     apply(pred$Y, 2, quantile, 0.975) >= data[i, seq(1, length(t), length = 21)])}))
## End(Not run)



