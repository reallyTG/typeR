library(spectralAnalysis)


### Name: spectralIntegration
### Title: Integrate spectraInTime object
### Aliases: spectralIntegration

### ** Examples

spectra                   <-  getSpectraInTimeExample()
defaults                  <-  spectralIntegration( spectra , c(200 , 300) , timeUnit = "hours" )
unsmoothedTrend           <-  spectralIntegration( spectra , c(200 , 300) , timeUnit = "hours" )
smoothedTrend             <-  spectralIntegration( spectra , c(200 , 300) ,
  smoothingValue = 0.5 , timeUnit = "hours" ) 



