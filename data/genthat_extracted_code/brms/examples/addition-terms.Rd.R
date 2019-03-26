library(brms)


### Name: addition-terms
### Title: Additional Response Information
### Aliases: addition-terms resp_se resp_weights resp_trials resp_cat
###   resp_dec resp_cens resp_trunc resp_mi

### ** Examples

## Not run: 
##D ## Random effects meta-analysis
##D nstudies <- 20
##D true_effects <- rnorm(nstudies, 0.5, 0.2)
##D sei <- runif(nstudies, 0.05, 0.3)
##D outcomes <- rnorm(nstudies, true_effects, sei)
##D data1 <- data.frame(outcomes, sei)
##D fit1 <- brm(outcomes | se(sei, sigma = TRUE) ~ 1,
##D             data = data1)
##D summary(fit1)
##D 
##D ## Probit regression using the binomial family
##D n <- sample(1:10, 100, TRUE)  # number of trials
##D success <- rbinom(100, size = n, prob = 0.4)
##D x <- rnorm(100)
##D data2 <- data.frame(n, success, x)
##D fit2 <- brm(success | trials(n) ~ x, data = data2,
##D             family = binomial("probit"))
##D summary(fit2)
##D 
##D ## Survival regression modeling the time between the first 
##D ## and second recurrence of an infection in kidney patients.
##D fit3 <- brm(time | cens(censored) ~ age * sex + disease + (1|patient), 
##D             data = kidney, family = lognormal())
##D summary(fit3)
##D 
##D ## Poisson model with truncated counts  
##D fit4 <- brm(count | trunc(ub = 104) ~ log_Base4_c * Trt_c, 
##D             data = epilepsy, family = poisson())
##D summary(fit4)
## End(Not run)
  



