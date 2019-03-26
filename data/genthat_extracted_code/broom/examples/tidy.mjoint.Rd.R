library(broom)


### Name: tidy.mjoint
### Title: Tidy a(n) mjoint object
### Aliases: tidy.mjoint mjoint_tidiers joinerml_tidiers

### ** Examples

## Not run: 
##D # Fit a joint model with bivariate longitudinal outcomes
##D library(joineRML)
##D data(heart.valve)
##D hvd <- heart.valve[!is.na(heart.valve$log.grad) &
##D                        !is.na(heart.valve$log.lvmi) &
##D                        heart.valve$num <= 50, ]
##D fit <- mjoint(
##D     formLongFixed = list(
##D         "grad" = log.grad ~ time + sex + hs,
##D         "lvmi" = log.lvmi ~ time + sex
##D     ),
##D     formLongRandom = list(
##D         "grad" = ~ 1 | num,
##D         "lvmi" = ~ time | num
##D     ),
##D     formSurv = Surv(fuyrs, status) ~ age,
##D     data = hvd,
##D     inits = list("gamma" = c(0.11, 1.51, 0.80)),
##D     timeVar = "time"
##D )
##D 
##D # Extract the survival fixed effects
##D tidy(fit)
##D 
##D # Extract the longitudinal fixed effects
##D tidy(fit, component = "longitudinal")
##D 
##D # Extract the survival fixed effects with confidence intervals
##D tidy(fit, ci = TRUE)
##D 
##D # Extract the survival fixed effects with confidence intervals based
##D # on bootstrapped standard errors
##D bSE <- bootSE(fit, nboot = 5, safe.boot = TRUE)
##D tidy(fit, boot_se = bSE, ci = TRUE)
##D 
##D # Augment original data with fitted longitudinal values and residuals
##D hvd2 <- augment(fit)
##D 
##D # Extract model statistics
##D glance(fit)
## End(Not run)




