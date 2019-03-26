library(spectralAnalysis)


### Name: normalize
### Title: generic normalization function
### Aliases: normalize normalize,SpectraInTime-method

### ** Examples

 spectralEx            <-  getSpectraInTimeExample()
 timeRange                        <-  range( getTimePoints( spectralEx ))
 timesToSelect                    <-  e(  seq( timeRange[1] , timeRange[2] , length.out = 5  )   )
 ## Not run: 
##D  plot( spectralEx )
##D  plot( spectralEx[ timesToSelect ,  ] , type = "time" )
## End(Not run)
 normalizePeak         <-  normalize( spectralEx , method = "peak" , wavelength = 400 )
 getPreprocessing( normalizePeak )
## Not run: 
##D  plot( normalizePeak[ timesToSelect ,  ] , type = "time" )
##D  plot( normalizePeak )
## End(Not run)
 normalizeIntegration  <-  normalize( spectralEx , method = "integration" )
## Not run: 
##D  plot( normalizeIntegration[ timesToSelect ,  ] , type = "time" )
## End(Not run)
 normalizedUser  <-  normalize( spectralEx , method = "normalize" , mean = "median" , scale = "sd" )
## Not run: 
##D  plot( normalizedUser[ timesToSelect ,  ] , type = "time" ) 
## End(Not run)



