library(timeSeries)


### Name: apply
### Title: Apply Functions Over Time Series Periods
### Aliases: fapply applySeries apply,timeSeries-method
### Keywords: chron

### ** Examples

## Percentual Returns of Swiss Bond Index and Performance Index - 
   LPP <- 100 * LPP2005REC[, c("SBI", "SPI")]
   head(LPP, 20)
   
## Aggregate Quarterly Returns -
   applySeries(LPP, by = "quarterly", FUN = colSums)
   
## Aggregate Quarterly every last Friday in Quarter -
   oneDay <- 24*3600
   from <- unique(timeFirstDayInQuarter(time(LPP))) - oneDay
   from <- timeLastNdayInMonth(from, nday = 5)
   to <- unique(timeLastDayInQuarter(time(LPP)))
   to <- timeLastNdayInMonth(to, nday = 5)
   data.frame(from = as.character(from), to = as.character(to))
   applySeries(LPP, from, to, FUN = colSums)
   
## Count Trading Days per Month - 
   colCounts <- function(x) rep(NROW(x), times = NCOL(x))
   applySeries(LPP, FUN = colCounts, by = "monthly")
   
## Alternative Use - 
   fapply(LPP, from, to, FUN = colSums)



