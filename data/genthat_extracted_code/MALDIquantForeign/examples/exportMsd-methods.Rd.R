library(MALDIquantForeign)


### Name: exportMsd,MassSpectrum-method
### Title: Export to MSD files
### Aliases: exportMsd,MassSpectrum-method exportMsd exportMsd,list-method

### ** Examples


## Not run: 
##D library("MALDIquant")
##D library("MALDIquantForeign")
##D 
##D s <- list(createMassSpectrum(mass=1:5, intensity=1:5),
##D           createMassSpectrum(mass=1:5, intensity=1:5))
##D p <- list(createMassPeaks(mass=4:5, intensity=4:5, snr=1:2),
##D           createMassPeaks(mass=4:5, intensity=4:5, snr=1:2))
##D 
##D ## export a single spectrum
##D exportMsd(s[[1]], file="spectrum.msd")
##D 
##D ## export a single spectrum with corresponding peaks
##D exportMsd(s[[1]], file="spectrum.msd", peaks=p[[1]])
##D 
##D ## export a list of spectra with corresponding peaks
##D exportMsd(s, path="spectra", peaks=p, force=TRUE)
## End(Not run)




