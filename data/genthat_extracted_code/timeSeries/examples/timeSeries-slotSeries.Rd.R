library(timeSeries)


### Name: series-methods
### Title: Get and Set Data of a 'timeSeries'
### Aliases: series series<- series,timeSeries-method
###   series<-,timeSeries,matrix-method series<-,timeSeries,ANY-method
###   series<-,timeSeries,data.frame-method
###   series<-,timeSeries,vector-method coredata coredata<-
###   coredata,timeSeries-method coredata<-,timeSeries,matrix-method
###   coredata<-,timeSeries,ANY-method
###   coredata<-,timeSeries,data.frame-method
###   coredata<-,timeSeries,vector-method
### Keywords: programming

### ** Examples

## A Dummy timeSeries Object
   ts <- timeSeries()
   ts

## Get the Matrix Part - 
   mat <- series(ts)
   class(mat)
   mat

## Assign a New Univariate Series - 
   series(ts) <- rnorm(12)
   ts
   
## Assign a New Bivariate Series - 
   series(ts) <- rnorm(12)
   ts



