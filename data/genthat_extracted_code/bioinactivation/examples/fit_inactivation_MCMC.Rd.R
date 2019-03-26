library(bioinactivation)


### Name: fit_inactivation_MCMC
### Title: Fitting of dynamic inactivation with MCMC
### Aliases: fit_inactivation_MCMC

### ** Examples

## EXAMPLE 1 ------
data(dynamic_inactivation)  # The example data set is used.

get_model_data()  # Retrieve the valid model keys.

simulation_model <- "Peleg"  # Peleg's model will be used

model_data <- get_model_data(simulation_model)
model_data$parameters  # Set the model parameters

dummy_temp <- data.frame(time = c(0, 1.25, 2.25, 4.6),
                         temperature = c(70, 105, 105, 70))  # Dummy temp. profile

## Set known parameters and initial points/bounds for unknown ones

known_params = c(temp_crit = 100)

starting_points <- c(n = 1, k_b = 0.25, N0 = 1e+05)
upper_bounds <- c(n = 2, k_b = 1, N0 = 1e6)
lower_bounds <- c(n = 0.5, k_b = 0.1, N0 = 1e4)

MCMC_fit <- fit_inactivation_MCMC(dynamic_inactivation, simulation_model,
                                     dummy_temp, starting_points,
                                     upper_bounds, lower_bounds,
                                     known_params,
                                     niter = 100)
                                     # It is recommended to increase niter

plot(MCMC_fit)
## END EXAMPLE 1 -----




