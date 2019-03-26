library(spectralAnalysis)


### Name: SpectraInTime-class
### Title: SpectraInTime-class (time resolved spectra ) wavelength-time
###   data for 1 experiment
### Aliases: SpectraInTime-class SpectraInTime spectraInTime spectraintime
###   dim,SpectraInTime-method extractSummarySpecs
###   summary,SpectraInTime-method show,SummaryByWavelengths-method
###   as.data.frame,SpectraInTime-method plot,SpectraInTime,missing-method
###   plot plot.list
### Keywords: internal

### ** Examples

  spectralExample   <-  getSpectraInTimeExample()
  mimMaxSpec        <-  spectralAnalysis:::extractSummarySpecs( spectralExample ,
 c( "min" , "max" ) )

 spectralExample  <-  getSpectraInTimeExample() 
 summarySpectra   <-  summary( spectralExample )
 str( summarySpectra )
 summarySpectra

## convert to data.frame
spectra                 <-  getSpectraInTimeExample()
spectraFlat             <-  as.data.frame( spectra )


### visualization 
  ## Not run: 
##D   data = getSpectraInTimeExample()
##D   plot( x =  data , type = "3D" , timeUnit = "hours" , timePointsAlt = FALSE )
##D   plot( x =  data[  , r(500, 350) ] , type = "3D" ,
##D       timeUnit = "hours" , timePointsAlt = TRUE , colors = "B"  )
##D   plot( x =  data[ e( 1 , 2 , 3) , , timeUnit = "hours" ] ,
##D       type = "time" , timeUnit = "hours" , timePointsAlt = FALSE ) 
##D   plot( x =  data[ , e( seq( 200 , 400 , 50 ) ) ] , 
##D      type = "wavelength" , timeUnit = "minutes" , timePointsAlt = TRUE , colors = "A" )
## End(Not run)

  
 ## plotting a list of spectra
    
 listOfSpectra     <-  getListOfSpectraExample()
 plot( listOfSpectra , times = 1 , timeUnit = "hours" )
 plot( listOfSpectra , times = 1 , timeUnit = "hours" , timePointsAlt = TRUE  )
 plot( listOfSpectra , times = 1:3 , timeUnit = "hours" , colors = "B" ) 



