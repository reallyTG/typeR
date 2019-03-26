library(BTYD)


### Name: dc.CreateFreqCBT
### Title: Create Frequency Customer-by-Time Matrix
### Aliases: dc.CreateFreqCBT

### ** Examples

# Create event log from file "cdnowElog.csv", which has
# customer IDs in the second column, dates in the third column, and
# sales numbers in the fifth column.
elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)

# Given that the dates are in the order year-month-day,
# it is not strictly necessary to convert the date column
# to date formats. However, it is good practice:
elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")

freq.cbt <- dc.CreateFreqCBT(elog)



