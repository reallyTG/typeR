library(edstan)


### Name: print_irt_stan
### Title: View a table of selected parameter posteriors after using
###   'irt_stan'
### Aliases: print_irt_stan

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
##D # Get a table of parameter posteriors
##D print_irt_stan(twopl_fit, spelling_list)
##D # Or
##D print_irt_stan(twopl_fit)
## End(Not run)



