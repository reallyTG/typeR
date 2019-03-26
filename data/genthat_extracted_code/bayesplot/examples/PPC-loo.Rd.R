library(bayesplot)


### Name: PPC-loo
### Title: LOO predictive checks
### Aliases: PPC-loo ppc_loo_pit_overlay ppc_loo_pit_qq ppc_loo_pit
###   ppc_loo_intervals ppc_loo_ribbon

### ** Examples


## Not run: 
##D library(rstanarm)
##D library(loo)
##D 
##D head(radon)
##D fit <- stan_lmer(
##D   log_radon ~ floor + log_uranium + floor:log_uranium
##D                + (1 + floor | county),
##D   data = radon,
##D   iter = 1000,
##D   chains = 2  # ,cores = 2
##D  )
##D y <- radon$log_radon
##D yrep <- posterior_predict(fit)
##D 
##D loo1 <- loo(fit, save_psis = TRUE, cores = 2)
##D psis1 <- loo1$psis_object
##D lw <- weights(psis1)
##D 
##D # marginal predictive check using LOO probability integral transform
##D color_scheme_set("orange")
##D ppc_loo_pit_overlay(y, yrep, lw = lw)
##D 
##D ppc_loo_pit_qq(y, yrep, lw = lw)
##D ppc_loo_pit_qq(y, yrep, lw = lw, compare = "normal")
##D 
##D 
##D # loo predictive intervals vs observations
##D keep_obs <- 1:50
##D ppc_loo_intervals(y, yrep, psis_object = psis1, subset = keep_obs)
##D 
##D color_scheme_set("gray")
##D ppc_loo_intervals(y, yrep, psis_object = psis1, subset = keep_obs,
##D                   order = "median")
## End(Not run)




