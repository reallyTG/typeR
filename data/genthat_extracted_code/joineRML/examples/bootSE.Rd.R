library(joineRML)


### Name: bootSE
### Title: Standard errors via bootstrap for an 'mjoint' object
### Aliases: bootSE
### Keywords: methods multivariate survival

### ** Examples

## Not run: 
##D # Fit a joint model with bivariate longitudinal outcomes
##D 
##D data(heart.valve)
##D hvd <- heart.valve[!is.na(heart.valve$log.grad) & !is.na(heart.valve$log.lvmi), ]
##D 
##D fit <- mjoint(
##D     formLongFixed = list("grad" = log.grad ~ time + sex + hs,
##D                          "lvmi" = log.lvmi ~ time + sex),
##D     formLongRandom = list("grad" = ~ 1 | num,
##D                           "lvmi" = ~ time | num),
##D     formSurv = Surv(fuyrs, status) ~ age,
##D     data = list(hvd, hvd),
##D     inits = list("gamma" = c(0.11, 1.51, 0.80)),
##D     timeVar = "time",
##D     verbose = TRUE)
##D 
##D fit.boot <- bootSE(fit, 50, use.mle = TRUE, control = list(
##D     burnin = 25, convCrit = "either",
##D     tol0 = 6e-03, tol2 = 6e-03, mcmaxIter = 60))
## End(Not run)



