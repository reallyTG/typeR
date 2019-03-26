library(diveMove)


### Name: TDR-accessors
### Title: Coerce, Extractor, and Replacement methods for class "TDR"
###   objects
### Aliases: TDR-methods TDR-accessors as.TDRspeed ccData<- depth<- speed<-
###   getCCData getDepth getDtime getFileName getTime getSpeed
###   [,TDR,numeric,missing,missing-method as.data.frame,TDR-method
###   coerce,TDR,data.frame-method as.TDRspeed,TDR-method
###   coerce,TDR,TDRspeed-method getCCData,TDR,missing-method
###   getCCData,TDR,character-method ccData<-,TDR,data.frame-method
###   getDepth,TDR-method getDtime,TDR-method depth<-,TDR,numeric-method
###   getFileName,TDR-method show,TDR-method getTime,TDR-method
###   getSpeed,TDRspeed-method speed<-,TDRspeed,numeric-method
### Keywords: methods

### ** Examples

data(divesTDR)

## Retrieve the name of the source file
getFileName(divesTDR)
## Retrieve concurrent temperature measurements
temp <- getCCData(divesTDR, "temperature"); head(temp)
temp <- getCCData(divesTDR); head(temp)

## Coerce to a data frame
dives.df <- as.data.frame(divesTDR)
head(dives.df)

## Replace speed measurements
newspeed <- getSpeed(divesTDR) + 2
speed(divesTDR) <- newspeed



