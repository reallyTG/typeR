library(psychmeta)


### Name: simulate_d_database
### Title: Simulate d value databases of primary studies
### Aliases: simulate_d_database
### Keywords: datagen

### ** Examples

## Define sample sizes, means, and other parameters for each of two groups:
n_params <- list(c(mean = 200, sd = 20),
                 c(mean = 100, sd = 20))
rho_params <- list(list(c(.3, .4, .5)),
                   list(c(.3, .4, .5)))
mu_params <- list(list(c(mean = .5, sd = .5), c(-.5, 0, .5)),
                  list(c(mean = 0, sd = .5), c(-.2, 0, .2)))
sigma_params <- list(list(1, 1),
                     list(1, 1))
rel_params <- list(list(.8, .8),
                   list(.8, .8))
sr_params <- list(1, .5)

simulate_d_database(k = 5, n_params = n_params, rho_params = rho_params,
                    mu_params = mu_params, sigma_params = sigma_params,
                    rel_params = rel_params, sr_params = sr_params,
                    k_items = c(4, 4),
                    group_names = NULL, var_names = c("y1", "y2"),
                    show_applicant = TRUE, keep_vars = c("y1", "y2"), decimals = 2)



