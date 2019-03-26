library(timeSeries)


### Name: sort
### Title: Sorting a 'timeSeries' by Time Stamps
### Aliases: sort,timeSeries-method sort.timeSeries
### Keywords: chron

### ** Examples
   
## Monthly Calendar Series -    
   x <- daily2monthly(LPP2005REC[, 1:2])[3:14, ]
   
## Resample the Series with respect to the time stamps -    
   resampled <- sample(x)
   resampled
   is.unsorted(resampled)
   
## Now sort the serie in decreasing time order - 
   sorted <- sort(resampled, , decreasing = TRUE)
   sorted
   is.unsorted(sorted)
   
## Is the reverted series ordered? - 
   reverted <- rev(sorted)
   reverted
   is.unsorted(reverted)



