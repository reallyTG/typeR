library(joineRML)


### Name: confint.mjoint
### Title: Confidence intervals for model parameters of an 'mjoint' object
### Aliases: confint.mjoint
### Keywords: methods

### ** Examples

# Fit a classical univariate joint model with a single longitudinal outcome
# and a single time-to-event outcome

data(heart.valve)
hvd <- heart.valve[!is.na(heart.valve$log.grad) & !is.na(heart.valve$log.lvmi), ]

gamma <- c(0.1059417, 1.0843359)
sigma2 <- 0.03725999
beta <- c(4.9988669999, -0.0093527634, 0.0004317697)
D <- matrix(c(0.128219108, -0.006665505, -0.006665505, 0.002468688),
            nrow = 2, byrow = TRUE)

set.seed(1)
fit1 <- mjoint(formLongFixed = log.lvmi ~ time + age,
    formLongRandom = ~ time | num,
    formSurv = Surv(fuyrs, status) ~ age,
    data = hvd,
    timeVar = "time",
    inits = list(gamma = gamma, sigma2 = sigma2, beta = beta, D = D),
    control = list(nMCscale = 2, burnin = 5)) # controls for illustration only

confint(fit1, parm = "Longitudinal")

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
##D confint(fit2)
## End(Not run)



