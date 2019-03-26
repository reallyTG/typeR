library(qgam)


### Name: tuneLearnFast
### Title: Fast learning rate calibration for the Gibbs posterior
### Aliases: tuneLearnFast

### ** Examples

library(qgam); library(MASS)

###
# Single quantile fit
###
# Calibrate learning rate on a grid
set.seed(5235)
tun <- tuneLearnFast(form = accel~s(times,k=20,bs="ad"), 
                     data = mcycle, 
                     err = 0.05, 
                     qu = 0.2)

# Fit for quantile 0.2 using the best sigma
fit <- qgam(accel~s(times, k=20, bs="ad"), data = mcycle, qu = 0.2,
            err = 0.05, lsig = tun$lsig)

pred <- predict(fit, se=TRUE)
plot(mcycle$times, mcycle$accel, xlab = "Times", ylab = "Acceleration", 
     ylim = c(-150, 80))
lines(mcycle$times, pred$fit, lwd = 1)
lines(mcycle$times, pred$fit + 2*pred$se.fit, lwd = 1, col = 2)
lines(mcycle$times, pred$fit - 2*pred$se.fit, lwd = 1, col = 2) 

###
# Multiple quantile fits
###
## Not run: 
##D # Calibrate learning rate on a grid
##D quSeq <- c(0.25, 0.5, 0.75)
##D set.seed(5235)
##D tun <- tuneLearnFast(form = accel~s(times, k=20, bs="ad"), 
##D                      data = mcycle, 
##D                      err = 0.05, 
##D                      qu = quSeq)
##D 
##D # Fit using estimated sigmas
##D fit <- mqgam(accel~s(times, k=20, bs="ad"), data = mcycle, qu = quSeq,
##D              err = 0.05, lsig = tun$lsig)
##D 
##D # Plot fitted quantiles
##D plot(mcycle$times, mcycle$accel, xlab = "Times", ylab = "Acceleration", 
##D      ylim = c(-150, 80))
##D for(iq in quSeq){
##D   pred <- qdo(fit, iq, predict)
##D   lines(mcycle$times, pred, col = 2)
##D }   
## End(Not run)                




