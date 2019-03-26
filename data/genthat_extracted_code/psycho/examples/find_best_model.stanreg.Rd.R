library(psycho)


### Name: find_best_model.stanreg
### Title: Returns the best combination of predictors based on LOO
###   cross-validation indices.
### Aliases: find_best_model.stanreg

### ** Examples

## Not run: 
##D library(psycho)
##D library(rstanarm)
##D 
##D data <- standardize(attitude)
##D fit <- rstanarm::stan_glm(rating ~ advance + privileges, data = data)
##D 
##D best <- find_best_model(fit)
##D best_formula <- best$formula
##D best$table
##D 
##D # To deactivate Kfold evaluation
##D best <- find_best_model(fit, K = 0)
## End(Not run)




