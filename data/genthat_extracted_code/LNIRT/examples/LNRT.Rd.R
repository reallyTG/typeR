library(LNIRT)


### Name: LNRT
### Title: Log-normal response time modelling
### Aliases: LNRT

### ** Examples

## Not run: 
##D # Log-normal response time modelling
##D data <- simLNIRT(N = 500, K = 20, rho = 0.8, WL = FALSE)
##D out <- LNRT(RT = RT, data = data, XG = 1500, residual = TRUE, td = TRUE, WL = FALSE)
##D summary(out) # Print results
##D out$Post.Means$Time.Intensity # Extract posterior mean estimates
##D 
##D library(coda)
##D mcmc.object <- as.mcmc(out$MCMC.Samples$Time.Intensity) # Extract MCMC samples for coda
##D summary(mcmc.object)
##D plot(mcmc.object)
## End(Not run)  



