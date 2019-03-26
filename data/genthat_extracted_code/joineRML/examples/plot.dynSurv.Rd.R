library(joineRML)


### Name: plot.dynSurv
### Title: Plot a 'dynSurv' object
### Aliases: plot.dynSurv
### Keywords: hplot

### ** Examples

## Not run: 
##D # Fit a joint model with bivariate longitudinal outcomes
##D 
##D data(heart.valve)
##D hvd <- heart.valve[!is.na(heart.valve$log.grad) & !is.na(heart.valve$log.lvmi), ]
##D 
##D fit2 <- mjoint(
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
##D hvd2 <- droplevels(hvd[hvd$num == 1, ])
##D out1 <- dynSurv(fit2, hvd2)
##D plot(out1, main = "Patient 1")
## End(Not run)

## Not run: 
##D # Monte Carlo simulation with 95% confidence intervals on plot
##D 
##D out2 <- dynSurv(fit2, hvd2, type = "simulated", M = 200)
##D plot(out2, main = "Patient 1")
## End(Not run)



