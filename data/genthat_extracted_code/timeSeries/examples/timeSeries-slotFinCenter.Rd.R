library(timeSeries)


### Name: finCenter
### Title: Get and Set Financial Center of a 'timeSeries'
### Aliases: getFinCenter setFinCenter<- finCenter,timeSeries-method
###   finCenter<-,timeSeries-method
### Keywords: programming

### ** Examples

## An artificial timeSeries Object - 
   tS <- dummySeries()
   tS

## Print Financial Center -
   finCenter(tS)
   getFinCenter(tS)

## Assign New Financial Center - 
   finCenter(tS) <- "Zurich"
   tS
   setFinCenter(tS) <- "New_York"
   tS



