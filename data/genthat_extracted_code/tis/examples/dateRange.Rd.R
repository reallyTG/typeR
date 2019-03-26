library(tis)


### Name: dateRange
### Title: Start and End Time Indices for a Series
### Aliases: dateRange
### Keywords: ts

### ** Examples

aTs <- ts(1:24, start = c(2001, 1), freq = 12)
aTis <- as.tis(aTs)
dateRange(aTs)
dateRange(aTis)



