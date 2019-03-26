library(BTYD)


### Name: dc.ReadLines
### Title: Read Lines
### Aliases: dc.ReadLines

### ** Examples

# Create event log from file "cdnowElog.csv", which has
# customer IDs in the second column, dates in the third column, and
# sales numbers in the fifth column.
elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)

# convert date column to date objects, as required by some other functions
elog$date <- as.Date(elog$date, "$Y%m%d")



