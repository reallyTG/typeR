library(bvarsv)


### Name: sim.var1.sv.tvp
### Title: Simulate from a VAR(1) with Stochastic Volatility and
###   Time-Varying Parameters
### Aliases: sim.var1.sv.tvp
### Keywords: forecasting methods

### ** Examples

## Not run: 
##D 
##D # Generate data from a model with moderate time variation in the parameters 
##D # and error term variances
##D set.seed(5813)
##D sim <- sim.var1.sv.tvp(Q = 1e-5*diag(6), S = 1e-5*diag(1), W = 1e-5*diag(2))
##D # Plot both series
##D matplot(sim$data, type = "l")
##D # Plot AR(1) parameters of both equations
##D matplot(cbind(sim$Beta[1,2,], sim$Beta[2,3,]), type = "l")
##D 
## End(Not run)



