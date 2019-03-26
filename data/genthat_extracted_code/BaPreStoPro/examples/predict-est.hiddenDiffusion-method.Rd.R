library(BaPreStoPro)


### Name: predict,est.hiddenDiffusion-method
### Title: Prediction for a hidden diffusion process
### Aliases: predict,est.hiddenDiffusion-method

### ** Examples

## Not run: 
##D model <- set.to.class("hiddenDiffusion", parameter = list(phi = 5, gamma2 = 1, sigma2 = 0.1))
##D t <- seq(0, 1, by = 0.01)
##D data <- simulate(model, t = t)
##D est_hiddiff <- estimate(model, t, data$Z, 100)  # nMCMC should be much larger!
##D plot(est_hiddiff)
##D 
##D pred_hiddiff <- predict(est_hiddiff, t = seq(0, 1, by = 0.1))
##D pred_hiddiff2 <- predict(est_hiddiff, which.series = "current")
##D 
##D pred_hiddiff <- predict(est_hiddiff, pred.alg = "simpleTrajectory", sample.length = 100)
##D pred_hiddiff <- predict(est_hiddiff, pred.alg = "simpleBayesTrajectory")
## End(Not run)



