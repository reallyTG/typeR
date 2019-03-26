library(BaPreStoPro)


### Name: predict,est.Diffusion-method
### Title: Prediction for a diffusion process
### Aliases: predict,est.Diffusion-method

### ** Examples

model <- set.to.class("Diffusion", parameter = list(phi = 0.5, gamma2 = 0.01))
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, y0 = 0.5)
est_diff <- estimate(model, t, data, 1000) # better: 10000
plot(est_diff)
## Not run: 
##D pred_diff <- predict(est_diff, t = seq(0, 1, by = 0.1))
##D pred_diff <- predict(est_diff, b.fun.mat = function(phi, t, y) phi[,1])  # much faster
##D pred_diff2 <- predict(est_diff, which.series = "current", b.fun.mat = function(phi, t, y) phi[,1])
##D pred_diff3 <- predict(est_diff, which.series = "current", y.start = data[51],
##D                t = t[seq(51, 100, by = 5)], b.fun.mat = function(phi, t, y) phi[,1])
## End(Not run)
pred_diff <- predict(est_diff, Euler.interval = TRUE, b.fun.mat = function(phi, t, y) phi[,1])
# one step Euler approximation
pred_diff <- predict(est_diff, pred.alg = "simpleTrajectory", sample.length = 100)
for(i in 1:100) lines(t[-1], pred_diff[i,], col = "grey")
pred_diff <- predict(est_diff, pred.alg = "simpleBayesTrajectory")



