library(LNIRT)


### Name: LNIRT
### Title: Log-normal response time IRT modelling
### Aliases: LNIRT

### ** Examples

## Not run: 
##D # Log-normal response time IRT modelling
##D data <- simLNIRT(N = 500, K = 20, rho = 0.8, WL = FALSE)
##D out <- LNIRT(RT = RT, Y = Y, data = data, XG = 1500, residual = TRUE, WL = FALSE)
##D summary(out) # Print results
##D out$Post.Means$Item.Difficulty # Extract posterior mean estimates 
##D 
##D library(coda)
##D mcmc.object <- as.mcmc(out$MCMC.Samples$Item.Difficulty) # Extract MCMC samples for coda
##D summary(mcmc.object)
##D plot(mcmc.object)
## End(Not run)  



