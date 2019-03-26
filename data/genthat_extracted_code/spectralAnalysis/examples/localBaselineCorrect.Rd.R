library(spectralAnalysis)


### Name: localBaselineCorrect
### Title: local baseline correct, substract a baseline either trough 1 or
###   2 points
### Aliases: localBaselineCorrect

### ** Examples

spectra              <-  getSpectraInTimeExample()
spectraConstCorrect  <-  localBaselineCorrect( spectra , baseWavelengths = 240  )
spectraLinCorrect    <-  localBaselineCorrect( spectra , c( 250 , 330 )  ) 
## Not run: 
##D plot( spectra )
##D plot( spectraConstCorrect )
##D plot( spectraLinCorrect ) 
## End(Not run)



