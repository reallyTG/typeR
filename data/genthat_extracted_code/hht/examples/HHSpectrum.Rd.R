library(hht)


### Name: HHSpectrum
### Title: Generate Hilbert spectrum
### Aliases: HHSpectrum
### Keywords: ts

### ** Examples

data(PortFosterEvent)

emd.result <- Sig2IMF(sig, tt)

dfreq <- 0.1
hspec <- HHSpectrum(emd.result, dfreq)
HHSpecPlot(hspec, show.fourier = TRUE, scale.fourier = TRUE)




