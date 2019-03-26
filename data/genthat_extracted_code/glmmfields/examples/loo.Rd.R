library(glmmfields)


### Name: loo.glmmfields
### Title: Return LOO information criteria
### Aliases: loo.glmmfields loo

### ** Examples

## No test: 
set.seed(1)
s <- sim_glmmfields(n_draws = 12, n_knots = 12, gp_theta = 1.5,
gp_sigma = 0.2, sd_obs = 0.2)
# options(mc.cores = parallel::detectCores()) # for parallel processing

# save_log_lik defaults to FALSE to save space but is needed for loo():
m <- glmmfields(y ~ 0, time = "time",
 lat = "lat", lon = "lon", data = s$dat,
 nknots = 12, iter = 1000, chains = 4, seed = 1,
 save_log_lik = TRUE)
loo(m)
## End(No test)



