library(BTYD)


### Name: dc.RemoveTimeBetween
### Title: Remove Time Between
### Aliases: dc.RemoveTimeBetween

### ** Examples

elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)
elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")

# Use the cdnow data to return a 6 month event log for January, February,
# March, October, November, December.
period.one.start <- as.Date("1997-01-01")
period.one.end <- as.Date("1997-03-31")
period.two.start <- as.Date("1997-10-01")
period.two.end <- as.Date("1997-12-31")
reduced.elog <- dc.RemoveTimeBetween(elog, period.one.start, period.one.end,
                                     period.two.start, period.two.end)

# Note that the new elog will go up to June 30 at a maximum, since we
# are only using 6 months of data starting on January 1
max(reduced.elog$elog3$date)  # "1997-06-30"



