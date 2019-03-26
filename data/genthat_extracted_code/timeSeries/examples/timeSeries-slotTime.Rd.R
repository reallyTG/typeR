library(timeSeries)


### Name: time
### Title: Get and Set Time stamps of a 'timeSeries'
### Aliases: time time<- time,timeSeries-method time.timeSeries
###   time<-.timeSeries sample,timeSeries-method getTime setTime<-
### Keywords: chron

### ** Examples
   
## Create Dummy timeSeries -      
   X <- timeSeries(matrix(rnorm(24), 12), timeCalendar())
   
## Return Series Positions -
   getTime(X)
   time(X)  
  
## Add / Subtract one Day from X
   setTime(X) <- time(X) - 24*3600 # sec
   X
   time(X) <- time(X) + 24*3600 # sec
   X



