library(qgam)


### Name: mqgam
### Title: Fit multiple smooth additive quantile regression models
### Aliases: mqgam

### ** Examples


#####
# Multivariate Gaussian example
####
library(qgam)
set.seed(2)
dat <- gamSim(1, n=300, dist="normal", scale=2)

fit <- mqgam(y~s(x0)+s(x1)+s(x2)+s(x3), data=dat, err = 0.05, qu = c(0.2, 0.8))

invisible( qdo(fit, 0.2, plot, pages = 1) )

#####
# Univariate "car" example
####
## Not run: 
##D library(qgam); library(MASS)
##D 
##D # Fit for quantile 0.8 using the best sigma
##D quSeq <- c(0.2, 0.4, 0.6, 0.8)
##D set.seed(6436)
##D fit <- mqgam(accel~s(times, k=20, bs="ad"), data = mcycle, err = 0.05, qu = quSeq)
##D 
##D # Plot the fit
##D xSeq <- data.frame(cbind("accel" = rep(0, 1e3), "times" = seq(2, 58, length.out = 1e3)))
##D plot(mcycle$times, mcycle$accel, xlab = "Times", ylab = "Acceleration", ylim = c(-150, 80))
##D for(iq in quSeq){
##D   pred <- qdo(fit, iq, predict, newdata = xSeq)
##D   lines(xSeq$times, pred, col = 2)
##D }
## End(Not run)




