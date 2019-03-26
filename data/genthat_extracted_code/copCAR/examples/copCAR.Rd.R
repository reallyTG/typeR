library(copCAR)


### Name: copCAR
### Title: Fit copCAR model to discrete areal data.
### Aliases: copCAR

### ** Examples

## Not run: 
##D # Simulate data and fit copCAR to them.
##D 
##D # Use the 20 x 20 square lattice as the underlying graph.
##D 
##D m = 20
##D A = adjacency.matrix(m)
##D 
##D # Create a design matrix by assigning coordinates to each vertex
##D # such that the coordinates are restricted to the unit square.
##D 
##D x = rep(0:(m - 1) / (m - 1), times = m)
##D y = rep(0:(m - 1) / (m - 1), each = m)
##D X = cbind(x, y)
##D 
##D # Set the dependence parameter and regression coefficients.
##D 
##D rho = 0.995      # strong dependence
##D beta = c(1, 1)   # the mean surface increases in the direction of (1, 1)
##D theta = 2        # dispersion parameter
##D 
##D # Simulate negative binomial data from the model.
##D 
##D z = rcopCAR(rho, beta, X, A, family = negbinomial(theta))
##D 
##D # Fit the copCAR model using the continous extension, and compute 95% (default)
##D # asymptotic confidence intervals. Give theta the initial value of 1. Use m equal to 100.
##D 
##D fit.ce = copCAR(z ~ X - 1, A = A, family = negbinomial(1), method = "CE", confint = "asymptotic",
##D                 control = list(m = 100))
##D summary(fit.ce)
##D 
##D # Fit the copCAR model using the DT approximation, and compute 90% confidence
##D # intervals. Bootstrap the intervals, based on a bootstrap sample of size 100.
##D # Do the bootstrap in parallel, using ten nodes.
##D 
##D fit.dt = copCAR(z ~ X - 1, A = A, family = negbinomial(1), method = "DT", confint = "bootstrap",
##D                 control = list(bootit = 100, nodes = 10))
##D summary(fit.dt, alpha = 0.9)
##D 
##D # Fit the copCAR model using the composite marginal likelihood approach.
##D # Do not compute confidence intervals.
##D 
##D fit.cml = copCAR(z ~ X - 1, A = A, family = negbinomial(1), method = "CML", confint = "none")
##D summary(fit.cml)
## End(Not run)



