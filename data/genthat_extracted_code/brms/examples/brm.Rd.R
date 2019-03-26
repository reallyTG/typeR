library(brms)


### Name: brm
### Title: Fit Bayesian Generalized (Non-)Linear Multivariate Multilevel
###   Models
### Aliases: brm

### ** Examples

## Not run: 
##D # Poisson regression for the number of seizures in epileptic patients
##D # using student_t priors for population-level effects
##D # and half cauchy priors for standard deviations of group-level effects
##D bprior1 <- prior(student_t(5,0,10), class = b) +
##D   prior(cauchy(0,2), class = sd)
##D fit1 <- brm(count ~ log_Age_c + log_Base4_c * Trt + (1|patient),
##D             data = epilepsy, family = poisson(), prior = bprior1)
##D 
##D # generate a summary of the results
##D summary(fit1)
##D 
##D # plot the MCMC chains as well as the posterior distributions
##D plot(fit1, ask = FALSE)
##D 
##D # predict responses based on the fitted model
##D head(predict(fit1))
##D 
##D # plot marginal effects for each predictor
##D plot(marginal_effects(fit1), ask = FALSE)
##D 
##D # investigate model fit
##D loo(fit1)
##D pp_check(fit1)
##D 
##D 
##D # Ordinal regression modeling patient's rating of inhaler instructions
##D # category specific effects are estimated for variable 'treat'
##D fit2 <- brm(rating ~ period + carry + cs(treat),
##D             data = inhaler, family = sratio("logit"),
##D             prior = set_prior("normal(0,5)"), chains = 2)
##D summary(fit2)
##D plot(fit2, ask = FALSE)
##D WAIC(fit2)
##D 
##D 
##D # Survival regression modeling the time between the first
##D # and second recurrence of an infection in kidney patients.
##D fit3 <- brm(time | cens(censored) ~ age * sex + disease + (1|patient),
##D             data = kidney, family = lognormal())
##D summary(fit3)
##D plot(fit3, ask = FALSE)
##D plot(marginal_effects(fit3), ask = FALSE)
##D 
##D 
##D # Probit regression using the binomial family
##D ntrials <- sample(1:10, 100, TRUE)
##D success <- rbinom(100, size = ntrials, prob = 0.4)
##D x <- rnorm(100)
##D data4 <- data.frame(ntrials, success, x)
##D fit4 <- brm(success | trials(ntrials) ~ x, data = data4,
##D             family = binomial("probit"))
##D summary(fit4)
##D 
##D 
##D # Simple non-linear gaussian model
##D x <- rnorm(100)
##D y <- rnorm(100, mean = 2 - 1.5^x, sd = 1)
##D data5 <- data.frame(x, y)
##D bprior5 <- prior(normal(0, 2), nlpar = a1) +
##D   prior(normal(0, 2), nlpar = a2)
##D fit5 <- brm(bf(y ~ a1 - a2^x, a1 + a2 ~ 1, nl = TRUE),
##D             data = data5, prior = bprior5)
##D summary(fit5)
##D plot(marginal_effects(fit5), ask = FALSE)
##D 
##D 
##D # Normal model with heterogeneous variances
##D data_het <- data.frame(
##D   y = c(rnorm(50), rnorm(50, 1, 2)),
##D   x = factor(rep(c("a", "b"), each = 50))
##D )
##D fit6 <- brm(bf(y ~ x, sigma ~ 0 + x), data = data_het)
##D summary(fit6)
##D plot(fit6)
##D marginal_effects(fit6)
##D 
##D # extract estimated residual SDs of both groups
##D sigmas <- exp(posterior_samples(fit6, "^b_sigma_"))
##D ggplot(stack(sigmas), aes(values)) +
##D   geom_density(aes(fill = ind))
##D 
##D 
##D # Quantile regression predicting the 25%-quantile
##D fit7 <- brm(bf(y ~ x, quantile = 0.25), data = data_het,
##D             family = asym_laplace())
##D summary(fit7)
##D marginal_effects(fit7)
##D 
##D 
##D # use the future package for more flexible parallelization
##D library(future)
##D plan(multiprocess)
##D fit7 <- update(fit7, future = TRUE)
## End(Not run)




