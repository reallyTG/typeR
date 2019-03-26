library(baseline)


### Name: baseline-package
### Title: Baseline correction
### Aliases: baseline-package
### Keywords: baseline spectra

### ** Examples

# Load data
data(milk)
# The baseline() function is an S4 wrapper for all the different 
# baseline correction methods. The default correction method
# is IRLS. Data must be organized as row vectors in a matrix
# or data.frame.
bc.irls <- baseline(milk$spectra[1,, drop=FALSE])
## Not run: 
##D   # Computationally heavy
##D 	plot(bc.irls)
## End(Not run)

# Available extractors are:
# getBaseline(bc.irls)
# getSpectra(bc.irls)
# getCorrected(bc.irls)
# getCall(bc.irls)

# Correction methods and parameters can be specified through the wrapper.
bc.fillPeaks <- baseline(milk$spectra[1,, drop=FALSE], lambda=6,
	hwi=50, it=10, int=2000, method='fillPeaks')
## Not run: 
##D   # Computationally heavy
##D 	plot(bc.fillPeaks)
## End(Not run)

# If a suitable gWidgets implementation is installed, a 
# graphical user interface is available for interactive
# parameter adaption.
## Not run: 
##D   # Dependent on external software
##D   baselineGUI(milk$spectra)
## End(Not run)



