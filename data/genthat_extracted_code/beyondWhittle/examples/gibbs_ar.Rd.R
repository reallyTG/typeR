library(beyondWhittle)


### Name: gibbs_ar
### Title: Gibbs sampler for an autoregressive model with PACF
###   parametrization.
### Aliases: gibbs_ar

### ** Examples

## Not run: 
##D 
##D ##
##D ## Example 1: Fit an AR(p) model to sunspot data:
##D ##
##D 
##D # Use this variable to set the AR model order
##D p <- 2
##D 
##D data <- sqrt(as.numeric(sunspot.year))
##D data <- data - mean(data)
##D 
##D # If you run the example be aware that this may take several minutes
##D print("example may take some time to run")
##D mcmc <- gibbs_ar(data=data, ar.order=p, Ntotal=10000, burnin=4000, thin=2)
##D 
##D # Plot spectral estimate, credible regions and periodogram on log-scale
##D plot(mcmc, log=T)
##D 
##D 
##D ##
##D ## Example 2: Fit an AR(p) model to high-peaked AR(1) data
##D ##
##D 
##D # Use this variable to set the AR model order
##D p <- 1
##D 
##D n <- 256
##D data <- arima.sim(n=n, model=list(ar=0.95)) 
##D data <- data - mean(data)
##D omega <- fourier_freq(n)
##D psd_true <- psd_arma(omega, ar=0.95, ma=numeric(0), sigma2=1)
##D 
##D # If you run the example be aware that this may take several minutes
##D print("example may take some time to run")
##D mcmc <- gibbs_ar(data=data, ar.order=p, Ntotal=10000, burnin=4000, thin=2)
##D 
##D # Compare estimate with true function (green)
##D plot(mcmc, log=F, pdgrm=F, credib="uniform")
##D lines(x=omega, y=psd_true, col=3, lwd=2)
##D 
##D # Compute the Integrated Absolute Error (IAE) of posterior median
##D cat("IAE=", mean(abs(mcmc$psd.median-psd_true)[-1]) , sep="")
## End(Not run)



