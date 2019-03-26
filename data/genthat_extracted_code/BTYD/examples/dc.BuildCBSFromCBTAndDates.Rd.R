library(BTYD)


### Name: dc.BuildCBSFromCBTAndDates
### Title: Build CBS matrix from CBT matrix
### Aliases: dc.BuildCBSFromCBTAndDates

### ** Examples

elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)
elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")

# Transaction-flow models are about interpurchase times. Since we
# only know purchase times to the day, we merge all transaction on
# the same day. This example uses dc.MergeTransactionsOnSameDate
# to illustrate this; however, we could have simply used dc.CreateReachCBT
# instead of dc.CreateFreqCBT to obtain the same result.
merged.elog <- dc.MergeTransactionsOnSameDate(elog)
cutoff.date <- as.Date("1997-09-30")
freq.cbt <- dc.CreateFreqCBT(merged.elog)
cal.freq.cbt <- freq.cbt[,as.Date(colnames(freq.cbt)) <= cutoff.date]
holdout.freq.cbt <- freq.cbt[,as.Date(colnames(freq.cbt)) > cutoff.date]

cal.start.dates.indices <- dc.GetFirstPurchasePeriodsFromCBT(cal.freq.cbt)
cal.start.dates <- as.Date(colnames(cal.freq.cbt)[cal.start.dates.indices])
cal.end.dates.indices <- dc.GetLastPurchasePeriodsFromCBT(cal.freq.cbt)
cal.end.dates <- as.Date(colnames(cal.freq.cbt)[cal.end.dates.indices])
T.cal.total <- rep(cutoff.date, nrow(cal.freq.cbt))
cal.dates <- data.frame(cal.start.dates, cal.end.dates, T.cal.total)

# Create calibration period customer-by-sufficient-statistic data frame,
# using weeks as the unit of time.
cal.cbs <- dc.BuildCBSFromCBTAndDates(cal.freq.cbt, cal.dates,
	per="week", cbt.is.during.cal.period=TRUE)
# Force the calibration period customer-by-sufficient-statistic to only contain
# repeat transactions (required by BG/BB and Pareto/NBD models)
cal.cbs[,"x"] <- cal.cbs[,"x"] - 1

holdout.start <- cutoff.date+1
holdout.end <- as.Date(colnames(holdout.freq.cbt)[ncol(holdout.freq.cbt)])
holdout.dates <- c(holdout.start, holdout.end)

# Create holdout period customer-by-sufficient-statistic data frame, using weeks
# as the unit of time.
holdout.cbs <- dc.BuildCBSFromCBTAndDates(holdout.freq.cbt, holdout.dates,
	per="week", cbt.is.during.cal.period=FALSE)



