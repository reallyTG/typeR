library(joineRML)


### Name: mjoint
### Title: Fit a joint model to time-to-event data and multivariate
###   longitudinal data
### Aliases: mjoint
### Keywords: methods multivariate survival

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
summary(fit1)

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
##D summary(fit2)
## End(Not run)

## Not run: 
##D # Fit a univariate joint model and compare to the joineR package
##D 
##D data(pbc2)
##D pbc2$log.b <- log(pbc2$serBilir)
##D 
##D # joineRML package
##D fit.joineRML <- mjoint(
##D     formLongFixed = list("log.bil" = log.b ~ year),
##D     formLongRandom = list("log.bil" = ~ 1 | id),
##D     formSurv = Surv(years, status2) ~ age,
##D     data = pbc2,
##D     timeVar = "year")
##D summary(fit.joineRML)
##D 
##D # joineR package
##D pbc.surv <- UniqueVariables(pbc2, var.col = c("years", "status2"),
##D                             id.col = "id")
##D pbc.long <- pbc2[, c("id", "year", "log.b")]
##D pbc.cov <- UniqueVariables(pbc2, "age", id.col = "id")
##D pbc.jd <- jointdata(longitudinal = pbc.long, baseline = pbc.cov,
##D                     survival = pbc.surv, id.col = "id", time.col = "year")
##D fit.joineR <- joint(data = pbc.jd,
##D     long.formula = log.b ~ 1 + year,
##D     surv.formula = Surv(years, status2) ~ age,
##D     model = "int")
##D summary(fit.joineR)
## End(Not run)



