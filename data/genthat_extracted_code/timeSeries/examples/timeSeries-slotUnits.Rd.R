library(timeSeries)


### Name: units
### Title: Get and Set Unit Names of a 'timeSeries'
### Aliases: getUnits getUnits.default setUnits<-
### Keywords: programming

### ** Examples

## A Dummy timeSeries Object
   tS <- dummySeries()
   tS

## Get the Units - 
   getUnits(tS)

## Assign New Units to the Series - 
   setUnits(tS) <- c("A", "B")
   head(tS)



