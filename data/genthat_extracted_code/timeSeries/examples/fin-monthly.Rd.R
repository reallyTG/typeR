library(timeSeries)


### Name: monthly
### Title: Special Monthly Series
### Aliases: monthly countMonthlyRecords rollMonthlyWindows
###   rollMonthlySeries
### Keywords: chron

### ** Examples

## Load Microsoft Daily Data Set:
   x <- MSFT 
   
## Count Monthly Records -
   counts <- countMonthlyRecords(x)
   counts
   
## Quaterly Non-Overlapping Time Periods -
   windows <- rollMonthlyWindows(counts[-1, ], period = "3m", by = "3m") 
   windows
   
## Nicely Reprint Results as a data.frame -
   data.frame(cbind(FROM=format(windows$from), TO=format(windows$to)))
   
## Compute the average number of monthly trading days per quarter -  
   rollMonthlySeries(counts[-1, ], period = "3m", by = "3m", FUN=mean)



