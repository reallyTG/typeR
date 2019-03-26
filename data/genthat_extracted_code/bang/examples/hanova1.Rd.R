library(bang)


### Name: hanova1
### Title: Posterior sampling for a 1-way hierarchical ANOVA
### Aliases: hanova1

### ** Examples

# ======= Late 21st Century Global Temperature Data =======

# Extract data for RCP2.6
RCP26_2 <- temp2[temp2$RCP == "rcp26", ]

# Sample from the posterior under the default `noninformative' flat prior
# for (mu, sigma_alpha, log(sigma)).  Ratio-of-uniforms is used to sample
# from the marginal posterior for (log(sigma_alpha), log(sigma)).
temp_res <- hanova1(resp = RCP26_2[, 1], fac = RCP26_2[, 2])

# Plot of sampled values of (sigma_alpha, sigma)
plot(temp_res, params = "ru")

# Plot of sampled values of (log(sigma_alpha), log(sigma))
# (centred at (0,0))
plot(temp_res, ru_scale = TRUE)

# Plot of sampled values of (mu, sigma_alpha, sigma)
plot(temp_res)

# Estimated marginal posterior densities of the mean for each GCM
plot(temp_res, params = "pop", which_pop = "all", one_plot = TRUE)

# Posterior sample quantiles
probs <- c(2.5, 25, 50, 75, 97.5) / 100
round(t(apply(temp_res$sim_vals, 2, quantile, probs = probs)), 2)

# Ratio-of-uniforms information and posterior sample summaries
summary(temp_res)

# ======= Coagulation time data, from Table 11.2 Gelman et al (2014) =======

# With only 4 groups the posterior for sigma_alpha has a heavy right tail if
# the default `noninformative' flat prior for (mu, sigma_alpha, log(sigma))
# is used.  If we try to sample from the marginal posterior for
# (sigma_alpha, sigma) using the default generalized ratio-of-uniforms
# runing parameter value r = 1/2 then the acceptance region is not bounded.

# Two remedies: reparameterize the posterior and/or increase the value of r.

# (log(sigma_alpha), log(sigma)) parameterization, ru parameter r = 1/2
coag1 <- hanova1(resp = coagulation[, 1], fac = coagulation[, 2])

# (sigma_alpha, sigma) parameterization, ru parameter r = 1
coag2 <- hanova1(resp = coagulation[, 1], fac = coagulation[, 2],
               param = "original", r = 1)

# Values to compare to those in Table 11.3 of Gelman et al (2014)
all1 <- cbind(coag1$theta_sim_vals, coag1$sim_vals)
all2 <- cbind(coag2$theta_sim_vals, coag2$sim_vals)
round(t(apply(all1, 2, quantile, probs = probs)), 1)
round(t(apply(all2, 2, quantile, probs = probs)), 1)

# Pairwise plots of posterior samples from the group means
plot(coag1, which_pop = "all", plot_type = "pairs")

# Independent half-Cauchy priors for sigma_alpha and sigma
coag3 <- hanova1(resp = coagulation[, 1], fac = coagulation[, 2],
                 param = "original", prior = "cauchy", hpars = c(10, 1e6))




