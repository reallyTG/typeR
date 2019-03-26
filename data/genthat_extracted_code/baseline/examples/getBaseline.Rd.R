library(baseline)


### Name: getBaseline
### Title: Functions to extract the components of a "baseline" object
### Aliases: getBaseline getSpectra getCorrected getCall
### Keywords: spectra baseline

### ** Examples

data(milk)
bl <- baseline(milk$spectra[1:2,])
baseline  <- getBaseline(bl)
spectra   <- getSpectra(bl)
corrected <- getCorrected(bl)
call      <- getCall(bl)



