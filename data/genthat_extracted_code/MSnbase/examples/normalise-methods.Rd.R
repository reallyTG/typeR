library(MSnbase)


### Name: normalise-methods
### Title: Normalisation of 'MSnExp', 'MSnSet' and 'Spectrum' objects
### Aliases: normalise-methods normalise,Spectrum-method
###   normalise,Spectrum2-method normalise,MSnSet-method
###   normalise,MSnExp-method normalize-methods normalize,Spectrum-method
###   normalize,Spectrum2-method normalize,MSnSet-method
###   normalize,MSnExp-method scale,MSnSet-method normalise normalize
### Keywords: methods

### ** Examples

## quantifying full experiment
data(msnset)
msnset.nrm <- normalise(msnset, "quantiles")
msnset.nrm



