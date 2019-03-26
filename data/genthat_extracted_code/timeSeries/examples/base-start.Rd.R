library(timeSeries)


### Name: start
### Title: Start and End of a 'timeSeries'
### Aliases: start,timeSeries-method start.timeSeries end,timeSeries-method
###   end.timeSeries
### Keywords: chron

### ** Examples
   
## Create Dummy timeSeries -    
   tS <- dummySeries()[, 1]
   tS
   
## Return Start and end Time Stamp -
   c(start(tS), end(tS))
   range(time(tS))
   



