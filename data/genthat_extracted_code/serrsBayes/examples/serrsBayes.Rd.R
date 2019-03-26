library(serrsBayes)


### Name: serrsBayes
### Title: Bayesian modelling and quantification of Raman spectroscopy
### Aliases: serrsBayes serrsBayes-package

### ** Examples

# simulate some data with known parameter values
wavenumbers <- seq(700,1400,by=2)
spectra <- matrix(nrow=1, ncol=length(wavenumbers))
peakLocations <- c(840,  960, 1140, 1220, 1290)
peakAmplitude <- c(11500, 2500, 4000, 3000, 2500)
peakScale <- c(10, 15, 20, 10, 12)
signature <- weightedLorentzian(peakLocations, peakScale, peakAmplitude, wavenumbers)
baseline <- 1000*cos(wavenumbers/200) + 2*wavenumbers
spectra[1,] <- signature + baseline + rnorm(length(wavenumbers),0,200)
plot(wavenumbers, spectra[1,], type='l', xlab="Raman offset", ylab="intensity")
lines(wavenumbers, baseline, col=2, lty=4)
lines(wavenumbers, baseline + signature, col=4, lty=2)

# fit the model using SMC
lPriors <- list(scale.mu=log(11.6) - (0.4^2)/2, scale.sd=0.4, bl.smooth=10^11, bl.knots=50,
                beta.mu=5000, beta.sd=5000, noise.sd=200, noise.nu=4)

## Not run: 
##D ## takes approx. 1 minute for 100 SMC iterations with 10,000 particles
##D result <- fitSpectraSMC(wavenumbers, spectra, peakLocations, lPriors)
##D plot.ts(result$ess, xlab="SMC iterations", ylab="ESS")
##D 
##D # sample 200 particles from the posterior distribution
##D samp.idx <- sample.int(length(result$weights), 200, prob=result$weights)
##D plot(wavenumbers, spectra[1,], type='l', xlab="Raman offset", ylab="intensity")
##D for (pt in samp.idx) {
##D   bl.est <- result$basis %*% result$alpha[,1,pt]
##D   lines(wavenumbers, bl.est, col="#C3000009")
##D   lines(wavenumbers, bl.est + result$expFn[pt,], col="#0000C309")
##D }
## End(Not run)



