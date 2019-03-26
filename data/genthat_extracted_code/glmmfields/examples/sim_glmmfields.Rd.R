library(glmmfields)


### Name: sim_glmmfields
### Title: Simulate a random field with a MVT distribution
### Aliases: sim_glmmfields

### ** Examples

s <- sim_glmmfields(n_draws = 12, n_knots = 12, gp_theta = 1.5,
  gp_sigma = 0.2, sd_obs = 0.2)
names(s)



