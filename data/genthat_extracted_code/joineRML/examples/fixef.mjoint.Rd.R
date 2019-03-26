library(joineRML)


### Name: fixef.mjoint
### Title: Extract fixed effects estimates from an 'mjoint' object
### Aliases: fixef.mjoint
### Keywords: methods

### ** Examples

# Fit a classical univariate joint model with a single longitudinal outcome
# and a single time-to-event outcome

data(heart.valve)
hvd <- heart.valve[!is.na(heart.valve$log.grad) & !is.na(heart.valve$log.lvmi), ]

set.seed(1)
fit1 <- mjoint(formLongFixed = log.lvmi ~ time + age,
    formLongRandom = ~ time | num,
    formSurv = Surv(fuyrs, status) ~ age,
    data = hvd,
    timeVar = "time",
    control = list(nMCscale = 2, burnin = 5)) # controls for illustration only

fixef(fit1, process = "Longitudinal")
fixef(fit1, process = "Event")

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
##D fixef(fit2, process = "Longitudinal")
##D fixef(fit2, process = "Event")
## End(Not run)



