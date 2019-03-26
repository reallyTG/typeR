library(timeSeries)


### Name: na.contiguous
### Title: Find Longest Contiguous Stretch of non-NAs
### Aliases: na.contiguous,timeSeries-method

### ** Examples

## Dummy timeSeries with NAs entries
   data <- matrix(sample(c(1:20, rep(NA,4))), ncol = 2)
   s <- timeSeries(data, timeCalendar())
   
## Find the longest consecutive non-missing values
   na.contiguous(s)



