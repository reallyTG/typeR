library(timeSeries)


### Name: t
### Title: timeSeries Transpose
### Aliases: t,timeSeries-method
### Keywords: chron

### ** Examples

## Dummy timeSeries with NAs entries
   data <- matrix(1:24, ncol = 2)
   s <- timeSeries(data, timeCalendar())
   s
   
## Transpose 'timeSeries' -
   t(s)



