library(BaPreStoPro)


### Name: predict,est.jumpDiffusion-method
### Title: Prediction for a jump diffusion process
### Aliases: predict,est.jumpDiffusion-method

### ** Examples

model <- set.to.class("jumpDiffusion",
         parameter = list(theta = 0.1, phi = 0.05, gamma2 = 0.1, xi = c(3, 1/4)),
         Lambda = function(t, xi) (t/xi[2])^xi[1])
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, y0 = 0.5)
est_jd <- estimate(model, t, data, 2000)
plot(est_jd)
## Not run: 
##D pred_jd <- predict(est_jd, Lambda.mat = function(t, xi) (t/xi[,2])^xi[,1])
##D pred_jd2 <- predict(est_jd, pred.alg = "Distribution", pred.alg.N = "Distribution",
##D                     Lambda.mat = function(t, xi) (t/xi[,2])^xi[,1])
##D est <- estimate(model, t[1:81], data = list(N = data$N[1:81], Y = data$Y[1:81]), 2000)
##D pred <- predict(est, t = t[81:101], which.series = "current",
##D                      Lambda.mat = function(t, xi) (t/xi[,2])^xi[,1])
##D lines(t, data$Y, type = "l", lwd = 2)
## End(Not run)
pred_jd4 <- predict(est_jd, pred.alg = "simpleTrajectory", sample.length = 100)
for(i in 1:100) lines(t[-1], pred_jd4$Y[i,], col = "grey")
pred_jd5 <- predict(est_jd, pred.alg = "simpleBayesTrajectory", sample.length = 100)



