library(joineRML)


### Name: dynSurv
### Title: Dynamic predictions for the time-to-event data sub-model
### Aliases: dynSurv
### Keywords: survival

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
##D dynSurv(fit2, hvd2)
##D dynSurv(fit2, hvd2, u = 7) # survival at 7-years only
##D 
##D out <- dynSurv(fit2, hvd2, type = "simulated")
##D out
## End(Not run)



