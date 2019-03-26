library(bsplinePsd)


### Name: plot.psd
### Title: Plot method for psd class
### Aliases: plot.psd

### ** Examples

## Not run: 
##D 
##D set.seed(12345)
##D 
##D # Simulate AR(4) data
##D n = 2 ^ 7
##D ar.ex = c(0.9, -0.9, 0.9, -0.9)
##D data = arima.sim(n, model = list(ar = ar.ex))
##D data = data - mean(data)
##D 
##D # Run MCMC with linear B-spline prior (may take some time)
##D mcmc = gibbs_bspline(data, 10000, 5000, degree = 1)
##D 
##D # Plot result
##D plot(mcmc)
##D 
##D # Plot result on original scale with title
##D plot(mcmc, ylog = FALSE, main = "Estimate of PSD using the linear B-spline prior")
## End(Not run)



