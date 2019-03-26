library(irregulAR1)


### Name: ar1_sim_conditional
### Title: Simulate from a stationary Gaussian AR(1) process.
### Aliases: ar1_sim_conditional

### ** Examples

t_pred <- c(1, 3, 6:8, 10)
t_obs <- c(2, 5, 11:12)
x_obs <- rnorm(4)
rho <- 0.5
sigma <- 1
# Means equal 0
ar1_sim_conditional(t_pred, t_obs, x_obs, rho, sigma)
# Time-varying means
mu_pred <- t_pred + rnorm(length(t_pred))
mu_obs <- t_obs + rnorm(length(t_obs))
ar1_sim_conditional(t_pred, t_obs, x_obs + mu_obs, rho, sigma,
                    mu_pred, mu_obs)



