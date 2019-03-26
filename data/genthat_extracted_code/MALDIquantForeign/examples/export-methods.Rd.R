library(MALDIquantForeign)


### Name: export,AbstractMassObject-method
### Title: Export files
### Aliases: export,AbstractMassObject-method export export,list-method

### ** Examples


## Not run: 
##D library("MALDIquant")
##D library("MALDIquantForeign")
##D 
##D s <- list(createMassSpectrum(mass=1:5, intensity=1:5),
##D           createMassSpectrum(mass=1:5, intensity=1:5))
##D 
##D ## export a single spectrum
##D export(s[[1]], file="spectrum.csv")
##D ## identical to exportCsv(s[[1]], file="spectrum.csv")
##D 
##D ## export a list of spectra
##D export(s, path="spectra", type="csv")
##D ## identical to exportCsv(s, path="spectra")
## End(Not run)




