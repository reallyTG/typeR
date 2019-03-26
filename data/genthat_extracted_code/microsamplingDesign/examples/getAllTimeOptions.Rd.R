library(microsamplingDesign)


### Name: getAllTimeOptions
### Title: generate all possible time options from eligible time points and
###   number of samples per time interval ( time zone )
### Aliases: getAllTimeOptions

### ** Examples

  timeZonesEx              <-  getExampleTimeZones()
  fullTimePointsEx         <-  seq( 0 , 21 , 1 )
  print(timeZonesEx)
  setOfTimePoints          <-  getAllTimeOptions( timeZones = timeZonesEx , 
     fullTimePoints = fullTimePointsEx )
  setOfTimePoints          <-  getAllTimeOptions( 
    timeZones = data.frame(startTime = 0 , endTime = 21 , nPointsPerZone = 1) , 
    fullTimePoints = fullTimePointsEx 
   )



