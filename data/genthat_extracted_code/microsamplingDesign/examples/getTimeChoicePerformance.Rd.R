library(microsamplingDesign)


### Name: getTimeChoicePerformance
### Title: estimate the distance between population average an average over
###   sample datasets with given time points (zero point included)
### Aliases: getTimeChoicePerformance

### ** Examples

 # get example inputs
 fullPkData                 <-  getExampleTimeData() # PkData object
 fullTimePoints             <-  getTimePoints(fullPkData)
 examplePopAvCurve          <-  fullTimePoints^2 
 timePointIndicators        <-  c( 1 , 5, 21 ) # zero point included
 nGridPoints                <-  25
 timeGrid                   <-  seq( min( fullTimePoints ),
    max( fullTimePoints ) , length.out = nGridPoints ) 
 popCurveInterpolated       <-  microsamplingDesign:::interpolateVec( fullTimePoints ,
   examplePopAvCurve,  timeGrid )

 getTimeChoicePerformance( timePointInd = timePointIndicators, pkData = fullPkData ,
   popAvCurve = popCurveInterpolated, timeGrid ) 

 getTimeChoicePerformance( timePointInd = timePointIndicators, pkData = fullPkData ,
   popAvCurve = popCurveInterpolated, timeGrid, printMCError = TRUE ) 




