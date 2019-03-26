library(MALDIquantForeign)


### Name: exportMzMl,MassSpectrum-method
### Title: Export to mzML files
### Aliases: exportMzMl,MassSpectrum-method exportMzMl
###   exportMzMl,list-method

### ** Examples


## Not run: 
##D library("MALDIquant")
##D library("MALDIquantForeign")
##D 
##D s <- list(createMassSpectrum(mass=1:5, intensity=1:5),
##D           createMassSpectrum(mass=1:5, intensity=1:5))
##D 
##D ## export a single spectrum
##D exportMzMl(s[[1]], file="spectrum.mzML")
##D 
##D ## export a list of spectra
##D exportMzMl(s, path="spectra.mzML")
## End(Not run)




