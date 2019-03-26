library(psycho)


### Name: R2_LOO_Adjusted
### Title: Compute LOO-adjusted R2.
### Aliases: R2_LOO_Adjusted

### ** Examples

## Not run: 
##D library(psycho)
##D library(rstanarm)
##D 
##D data <- attitude
##D fit <- rstanarm::stan_glm(rating ~ advance + privileges, data = data)
##D 
##D R2_LOO_Adjusted(fit)
## End(Not run)




