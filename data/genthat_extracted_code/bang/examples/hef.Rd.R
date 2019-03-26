library(bang)


### Name: hef
### Title: Hierarchical Exponential Family Model
### Aliases: hef

### ** Examples

############################ Beta-binomial #################################

# ------------------------- Rat tumor data ------------------------------- #

# Default prior, sampling on (rotated) (log(mean), log(alpha + beta)) scale
rat_res <- hef(model = "beta_binom", data = rat)
## Not run: 
##D # Hyperparameters alpha and beta
##D plot(rat_res)
##D # Parameterization used for sampling
##D plot(rat_res, ru_scale = TRUE)
## End(Not run)
summary(rat_res)

# Choose rats with extreme sample probabilities
pops <- c(which.min(rat[, 1] / rat[, 2]), which.max(rat[, 1] / rat[, 2]))
# Population-specific posterior samples: separate plots
plot(rat_res, params = "pop", plot_type = "both", which_pop = pops)
# Population-specific posterior samples: one plot
plot(rat_res, params = "pop", plot_type = "dens", which_pop = pops,
     one_plot = TRUE, add_legend = TRUE)

# Default prior, sampling on (rotated) (alpha, beta) scale
rat_res <- hef(model = "beta_binom", data = rat, param = "original")
## Not run: 
##D plot(rat_res)
##D plot(rat_res, ru_scale = TRUE)
## End(Not run)
summary(rat_res)

# To produce a plot akin to Figure 5.3 of Gelman et al. (2014) we
# (a) Use the same prior for (alpha, beta)
# (b) Don't use axis rotation (rotate = FALSE)
# (c) Plot on the scale used for ratio-of-uniforms sampling (ru_scale = TRUE)
# (d) Note that the mode is relocated to (0, 0) in the plot
rat_res <- hef(model = "beta_binom", data = rat, rotate = FALSE)
## Not run: 
##D plot(rat_res, ru_scale = TRUE)
## End(Not run)
# This is the estimated location of the posterior mode
rat_res$f_mode

# User-defined prior, passing parameters
# (equivalent to prior = "gamma" with hpars = c(1, 0.01, 1, 0.01))
user_prior <- function(x, hpars) {
  return(dexp(x[1], hpars[1], log = TRUE) + dexp(x[2], hpars[2], log = TRUE))
}
user_prior_fn <- set_user_prior(user_prior, hpars = c(0.01, 0.01))
rat_res <- hef(model = "beta_binom", data = rat, prior = user_prior_fn)
## Not run: 
##D plot(rat_res)
## End(Not run)
summary(rat_res)

############################ Gamma-Poisson #################################

# ------------------------ Pump failure data ------------------------------ #

pump_res <- hef(model = "gamma_pois", data = pump)
# Hyperparameters alpha and beta
## Not run: 
##D plot(pump_res)
## End(Not run)
# Parameterization used for sampling
plot(pump_res, ru_scale = TRUE)
summary(pump_res)

# Choose pumps with extreme sample rates
pops <- c(which.min(pump[, 1] / pump[, 2]), which.max(pump[, 1] / pump[, 2]))
plot(pump_res, params = "pop", plot_type = "dens", which_pop = pops)



