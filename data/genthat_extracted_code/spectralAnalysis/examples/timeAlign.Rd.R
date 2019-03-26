library(spectralAnalysis)


### Name: timeAlign
### Title: Time align first object, using info in the second object
### Aliases: timeAlign timeAlign,SpectraInTime,ProcessTimes-method
###   timeAlign,list,ProcessTimesFrame-method
###   timeAlign,list,character-method

### ** Examples


 spectra             <-  getSpectraInTimeExample()
 listOfSpectra       <-  getListOfSpectraExample()
 processTimes        <-  getProcessTimesExample()
 processTimesFrame   <-  getProcessTimesFrameExample()
 pathProcessTimes    <-  getPathProcessTimesExample()
  
ex1  <-  timeAlign( x = spectra , y = processTimes ,
 cutCooling = TRUE , cutBeforeMinTemp = TRUE )
ex2  <-  timeAlign( x = listOfSpectra , y = processTimesFrame ,
 cutCooling = TRUE , cutBeforeMinTemp = TRUE )
ex3  <-  timeAlign( x = listOfSpectra , y = pathProcessTimes, 
 cutCooling = TRUE , cutBeforeMinTemp = TRUE  , timeFormat =  "%Y-%m-%d %H:%M:%OS" )



