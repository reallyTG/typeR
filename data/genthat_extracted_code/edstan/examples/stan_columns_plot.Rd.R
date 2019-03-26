library(edstan)


### Name: stan_columns_plot
### Title: View a plot of summary statistics after using 'irt_stan'
### Aliases: stan_columns_plot

### ** Examples

# Make a suitable data list:
spelling_list <- irt_data(response_matrix = spelling[, 2:5],
                          covariates = spelling[, "male", drop = FALSE],
                          formula = ~ 1 + male)

## Not run: 
##D # Fit a latent regression  2PL
##D twopl_fit <- irt_stan(spelling_list, model = "2pl_latent_reg.stan",
##D                       iter = 300, chains = 4)
##D 
##D # Get a plot showing Rhat statistics
##D rhat_columns(twopl_fit)
##D 
##D # Get a plot showing number of effective draws
##D rhat_columns(twopl_fit, stat = "n_eff")
## End(Not run)



