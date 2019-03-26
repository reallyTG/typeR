library(MALDIquantForeign)


### Name: exportImzMl,MassSpectrum-method
### Title: Export to imzML files
### Aliases: exportImzMl,MassSpectrum-method exportImzMl
###   exportImzMl,list-method

### ** Examples


## Not run: 
##D library("MALDIquant")
##D library("MALDIquantForeign")
##D 
##D s <- list(createMassSpectrum(mass=1:5, intensity=1:5),
##D           createMassSpectrum(mass=1:5, intensity=1:5))
##D 
##D ## export a list of spectra
##D exportImzMl(s, path="processed.imzML", coordinates=cbind(x=1:2, y=c(1, 1)))
## End(Not run)




