library(serrsBayes)


### Name: fitSpectraSMC
### Title: Fit the model using Sequential Monte Carlo (SMC).
### Aliases: fitSpectraSMC

### ** Examples

wavenumbers <- seq(200,600,by=10)
spectra <- matrix(nrow=1, ncol=length(wavenumbers))
peakLocations <- c(300,500)
peakAmplitude <- c(10000,4000)
peakScale <- c(10, 15)
signature <- weightedLorentzian(peakLocations, peakScale, peakAmplitude, wavenumbers)
baseline <- 1000*cos(wavenumbers/200) + 2*wavenumbers
spectra[1,] <- signature + baseline + rnorm(length(wavenumbers),0,200)
lPriors <- list(scale.mu=log(11.6) - (0.4^2)/2, scale.sd=0.4, bl.smooth=10^11, bl.knots=20,
                beta.mu=5000, beta.sd=5000, noise.sd=200, noise.nu=4)
result <- fitSpectraSMC(wavenumbers, spectra, peakLocations, lPriors, npart=500)



