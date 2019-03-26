library(BTYD)


### Name: dc.CreateSpendCBT
### Title: Create Spend Customer-by-Time Matrix
### Aliases: dc.CreateSpendCBT

### ** Examples

# Create event log from file "cdnowElog.csv", which has
# customer IDs in the second column, dates in the third column, and
# sales numbers in the fifth column.
elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5);

# Given that the dates are in the order year-month-day,
# it is not strictly necessary to convert the date column
# to date formats. However, it is good practice:
elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")

spend.cbt <- dc.CreateSpendCBT(elog)



