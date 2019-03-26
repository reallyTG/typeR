library(BTYD)


### Name: dc.ElogToCbsCbt
### Title: Convernt Event Log to CBS and CBT Matrices
### Aliases: dc.ElogToCbsCbt

### ** Examples

# Create event log from file "cdnowElog.csv", which has
# customer IDs in the second column, dates in the third column, and
# sales numbers in the fifth column.
elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)

elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")

data <- dc.ElogToCbsCbt(elog, per="week", T.cal=as.Date("1997-09-30"))



