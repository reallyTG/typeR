library(bsplinePsd)


### Name: gibbs_bspline
### Title: Metropolis-within-Gibbs sampler for spectral inference of a
###   stationary time series using a B-spline prior
### Aliases: gibbs_bspline

### ** Examples

## Not run: 
##D 
##D set.seed(123456)
##D 
##D # Generate AR(1) data with rho = 0.9
##D n = 128
##D data = arima.sim(n, model = list(ar = 0.9))
##D data = data - mean(data)
##D 
##D # Run MCMC (may take some time)
##D mcmc = gibbs_bspline(data, 10000, 5000)
##D 
##D require(beyondWhittle)  # For psd_arma() function
##D freq = 2 * pi / n * (1:(n / 2 + 1) - 1)[-c(1, n / 2 + 1)]  # Remove first and last frequency
##D psd.true = psd_arma(freq, ar = 0.9, ma = numeric(0), sigma2 = 1)  # True PSD
##D plot(mcmc)  # Plot log PSD (see documentation of plot.psd)
##D lines(freq, log(psd.true), col = 2, lty = 3, lwd = 2)  # Overlay true PSD
## End(Not run)



