library(MALDIquantForeign)


### Name: exportTab,AbstractMassObject-method
### Title: Export to text files
### Aliases: exportTab,AbstractMassObject-method exportTab
###   exportTab,list-method exportCsv exportCsv,AbstractMassObject-method
###   exportCsv,list-method

### ** Examples


## Not run: 
##D library("MALDIquant")
##D library("MALDIquantForeign")
##D 
##D s <- list(createMassSpectrum(mass=1:5, intensity=1:5),
##D           createMassSpectrum(mass=1:5, intensity=1:5))
##D 
##D ## export a single spectrum
##D exportTab(s[[1]], file="spectrum.tab")
##D 
##D ## export a list of spectra and use ; as separator
##D exportCsv(s, path="spectra", sep=";", force=TRUE)
## End(Not run)




