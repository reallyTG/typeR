library(bamlss)


### Name: jm_bamlss
### Title: Fit Flexible Additive Joint Models
### Aliases: jm_bamlss jm.mode jm.mcmc jm.transform jm.survplot jm.predict
### Keywords: regression models

### ** Examples

## Not run: 
##D 
##D set.seed(123)
##D ## Simulate survival data
##D ## with random intercepts/slopes and a linear effect of time,
##D ## constant association alpha and no effect of the derivative
##D d <- simJM(nsub = 200, long_setting = "linear", 
##D   alpha_setting = "constant",
##D   dalpha_setting = "zero", full = FALSE)
##D 
##D ## Formula of the according joint model
##D f <- list(
##D   Surv2(survtime, event, obs = y) ~ s(survtime, bs = "ps"),
##D   gamma ~ s(x1, bs = "ps"),
##D   mu ~ obstime + s(id, bs = "re") + 
##D     s(id, obstime, bs = "re"),
##D   sigma ~ 1,
##D   alpha ~ 1,
##D   dalpha ~ -1
##D )
##D 
##D ## Joint model estimation
##D ## jm_bamlss() sets the default optimizer and sampler function.
##D ## First, posterior mode estimates are computed using function
##D ## jm.mode(), afterwards the sampler jm.mcmc() is started.
##D b <- bamlss(f, data = d, family = "jm",
##D            timevar = "obstime", idvar = "id")
##D 
##D ## Plot estimated effects.
##D plot(b)
##D 
##D ## Predict event probabilities for two individuals
##D ## at 12 time units after their last longitudinal measurement.
##D ## The event probability is conditional on their survival
##D ## up to their last observed measurement.
##D p <- predict(b, type = "probabilities", id = c(1, 2), dt = 12, FUN = c95)
##D print(p)
##D 
##D ## Plot of survival probabilities and
##D ## corresponding longitudinal effects
##D ## for individual id.
##D jm.survplot(b, id = 3)
##D jm.survplot(b, id = 30)
##D 
##D 
##D ## Simulate survival data
##D ## with functional random intercepts and a nonlinear effect 
##D ## of time, time-varying association alpha and no effect 
##D ## of the derivative.
##D ## Note: This specification is the simJM default.
##D d <- simJM(nsub = 200, full = FALSE)
##D 
##D ## Formula of the according joint model
##D ## number of knots for the smooth nonlinear effect of time
##D klong <- 8
##D f <- list(
##D   Surv2(survtime, event, obs = y) ~ s(survtime, bs = "ps"),
##D   gamma ~ s(x1, bs = "ps"),
##D   mu ~ ti(id, bs = "re") + 
##D     ti(obstime, bs = "ps", k = klong) + 
##D     ti(id, obstime, bs = c("re", "ps"), 
##D       k = c(nlevels(d$id), klong)) + 
##D     s(x2, bs = "ps"),
##D   sigma ~ 1,
##D   alpha ~ s(survtime, bs = "ps"),
##D   dalpha ~ -1
##D )
##D 
##D ## Estimating posterior mode only using jm.mode()
##D b_mode <- bamlss(f, data = d, family = "jm",
##D                  timevar = "obstime", idvar = "id", 
##D                  sampler = FALSE)
##D 
##D ## Estimating posterior means using jm.mcmc() 
##D ##  with starting values generated from posterior mode 
##D b_mean <- bamlss(f, data = d, family = "jm",
##D                  timevar = "obstime", idvar = "id", optimizer = FALSE,
##D                  start = parameters(b_mode), results = FALSE)
##D 
##D ## Plot effects.
##D plot(b_mean, model = "alpha")
##D 
##D 
##D 
##D ## Simulate survival data
##D ## with functional random intercepts and an association nonlinear in mu
##D set.seed(234)
##D d <- simJM(nsub = 300, long_setting = "functional", alpha_setting = "nonlinear", 
##D            nonlinear = TRUE, full = FALSE, probmiss = 0.9)
##D 
##D ## Calculate longitudinal model to obtain starting values for mu
##D long_df <- 7
##D f_start <- y ~ ti(id, bs = "re") + ti(obstime, bs = "ps", k = long_df) + 
##D                ti(id, obstime, bs = c("re", "ps"), k = c(nlevels(d$id), long_df)) + 
##D                s(x2, bs = "ps")
##D b_start <- bamlss(f_start, data = d, sampler = FALSE)
##D mu <- predict(b_start)$mu
##D 
##D ## Fit joint model with nonlinear association (nonlinear = TRUE)
##D f <- list(
##D   Surv2(survtime, event, obs = y) ~ s(survtime, bs = "ps"),
##D   gamma ~ x1,
##D   mu ~ ti(id, bs = "re") + ti(obstime, bs = "ps", k = long_df) + 
##D        ti(id, obstime, bs = c("re", "ps"), k = c(nlevels(d$id), long_df)) + 
##D        s(x2, bs = "ps"),
##D   sigma ~ 1,
##D   alpha ~ 1,
##D   dalpha ~ -1
##D )
##D b <- bamlss(f, data = d, family = "jm", timevar = "obstime", idvar = "id", 
##D             nonlinear = TRUE, start_mu = mu, 
##D             n.iter = 6000, burnin = 2000, thin = 2)
##D plot(b)
##D samplestats(b$samples)
## End(Not run)



