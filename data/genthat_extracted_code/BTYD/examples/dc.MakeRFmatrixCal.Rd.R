library(BTYD)


### Name: dc.MakeRFmatrixCal
### Title: Make Calibration Period Recency-Frequency Matrix
### Aliases: dc.MakeRFmatrixCal

### ** Examples

elog <- dc.ReadLines(system.file("data/discreteSimElog.csv", package="BTYD"),1,2)
elog[,"date"] <- as.Date(elog[,"date"])

cutoff.date <- as.Date("1977-01-01")
cbt <- dc.CreateReachCBT(elog)
cal.cbt <- cbt[,as.Date(colnames(cbt)) <= cutoff.date]
holdout.cbt <- cbt[,as.Date(colnames(cbt)) > cutoff.date]

cal.start.dates.indices <- dc.GetFirstPurchasePeriodsFromCBT(cal.cbt)
cal.start.dates <- as.Date(colnames(cal.cbt)[cal.start.dates.indices])
cal.end.dates.indices <- dc.GetLastPurchasePeriodsFromCBT(cal.cbt)
cal.end.dates <- as.Date(colnames(cal.cbt)[cal.end.dates.indices])
T.cal.total <- rep(cutoff.date, nrow(cal.cbt))
cal.dates <- data.frame(cal.start.dates, cal.end.dates, T.cal.total)

# Create calibration period customer-by-sufficient-statistic data frame,
# using years as the unit of time.
cal.cbs <- dc.BuildCBSFromCBTAndDates(cal.cbt, cal.dates, per="year",
	cbt.is.during.cal.period=TRUE)

holdout.start <- as.Date(colnames(holdout.cbt)[1])
holdout.end <- as.Date(tail(colnames(holdout.cbt),n=1))
# The (-1) below is to remove the effect of the birth period - we are only
# interested in repeat transactions in the calibration period.
frequencies <- (cal.cbs[,"x"] - 1)
periods.of.final.purchases <- cal.cbs[,"t.x"]
num.of.purchase.periods <- ncol(cal.cbt) - 1

# Create a calibration period recency-frequency matrix
cal.rf.matrix <- dc.MakeRFmatrixCal(frequencies, periods.of.final.purchases,
	num.of.purchase.periods)



