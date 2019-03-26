library(timeSeries)


### Name: TimeSeriesSubsettings
### Title: Subsettig Time Series
### Aliases: TimeSeriesSubsettings [,timeSeries,ANY,index_timeSeries-method
###   [,timeSeries,character,character-method
###   [,timeSeries,character,index_timeSeries-method
###   [,timeSeries,character,missing-method
###   [,timeSeries,index_timeSeries,character-method
###   [,timeSeries,index_timeSeries,index_timeSeries-method
###   [,timeSeries,index_timeSeries,missing-method
###   [,timeSeries,matrix,index_timeSeries-method
###   [,timeSeries,matrix,missing-method
###   [,timeSeries,missing,character-method
###   [,timeSeries,missing,index_timeSeries-method
###   [,timeSeries,missing,missing-method
###   [,timeSeries,timeDate,character-method
###   [,timeSeries,timeDate,index_timeSeries-method
###   [,timeSeries,timeDate,missing-method
###   [,timeSeries,timeSeries,index_timeSeries-method
###   [,timeSeries,timeSeries,missing-method
###   [,timeSeries,time_timeSeries,ANY-method
###   [,timeSeries,time_timeSeries,character-method
###   [,timeSeries,time_timeSeries,index_timeSeries-method
###   [,timeSeries,time_timeSeries,missing-method $,timeSeries-method
###   [<-,timeSeries,timeDate,index_timeSeries-method
###   [<-,timeSeries,timeDate,missing-method
###   [<-,timeSeries,timeSeries,index_timeSeries-method
###   [<-,timeSeries,timeSeries,missing-method
###   [<-,timeSeries,character,character-method
###   [<-,timeSeries,character,index_timeSeries-method
###   [<-,timeSeries,character,missing-method
###   [<-,timeSeries,index_timeSeries,character-method
###   [<-,timeSeries,matrix,character-method
###   [<-,timeSeries,timeDate,character-method
###   [<-,timeSeries,timeSeries,character-method
###   [<-,timeSeries,character,ANY-method
###   [<-,timeSeries,timeDate,ANY-method $<-,timeSeries,ANY-method
###   $<-,timeSeries,factor-method $<-,timeSeries,numeric-method
###   $<-,timeSeries,ANY,ANY-method $<-,timeSeries,ANY,factor-method
###   $<-,timeSeries,ANY,numeric-method window,timeSeries-method
###   cut,timeSeries-method head,timeSeries-method tail,timeSeries-method
###   window.timeSeries cut.timeSeries head.timeSeries tail.timeSeries
###   outlier outlier,timeSeries-method outlier,ANY-method
### Keywords: chron

### ** Examples

## Create an Artificial timeSeries Object - 
   setRmetricsOptions(myFinCenter = "GMT")
   charvec <- timeCalendar()
   set.seed(4711)
   data <- matrix(exp(cumsum(rnorm(12, sd = 0.1))))
   tS <- timeSeries(data, charvec, units = "tS")
   tS
   
## Subset Series by Counts "[" - 
   tS[1:3, ]
       
## Subset the Head of the Series - 
   head(tS, 6)



