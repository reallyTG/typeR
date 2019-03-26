library(bitrugs)


### Name: transmission_analysis
### Title: Estimate transmission dynamics and parameters
### Aliases: transmission_analysis

### ** Examples

  ## Not run: 
##D   data(hospitaldata)
##D   # Short example run
##D   mcmcoutput <- transmission_analysis(epidata=hospitaldata$epi, distmat=hospitaldata$distmat, 
##D                            seqIDs=hospitaldata$patientseqIDs, resmat=hospitaldata$resmat, 
##D                            path=getwd(), iterations=10000, augmoves=5)
##D   traceplots(mcmcoutput)
##D   
## End(Not run)



