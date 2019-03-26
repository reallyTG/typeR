library(BTYD)


### Name: dc.MergeCustomers
### Title: Merge Customers
### Aliases: dc.MergeCustomers

### ** Examples

elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5)
elog[,"date"] <- as.Date(elog[,"date"], "%Y%m%d")
cutoff.date <- as.Date("1997-09-30")
cal.elog <- elog[which(elog[,"date"] <= cutoff.date),]
holdout.elog <- elog[which(elog[,"date"] > cutoff.date),]

# Create calibration period CBT from cal.elog
cal.reach.cbt <- dc.CreateReachCBT(cal.elog)
# Create holdout period CBT from holdout.elog
holdout.reach.cbt <- dc.CreateReachCBT(holdout.elog)

# Note the difference:
nrow(cal.reach.cbt)            # 2357 customers
nrow(holdout.reach.cbt)        # 684 customers

# Create a "fixed" holdout period CBT, with the same number
# of customers in the same order as the calibration period CBT
fixed.holdout.reach.cbt <- dc.MergeCustomers(cal.reach.cbt, holdout.reach.cbt)
nrow(fixed.holdout.reach.cbt)  # 2357 customers

# You can verify that the above is correct by turning these into a CBS
# (see \code{dc.BuildCBSFromCBTAndDates} and using
# \code{pnbd.PlotFreqVsConditionalExpectedFrequency}, for example

# Alternatively, we can fix the CBS, instead of the CBS:

cal.start.dates.indices <- dc.GetFirstPurchasePeriodsFromCBT(cal.reach.cbt)
cal.start.dates <- as.Date(colnames(cal.reach.cbt)[cal.start.dates.indices])
cal.end.dates.indices <- dc.GetLastPurchasePeriodsFromCBT(cal.reach.cbt)
cal.end.dates <- as.Date(colnames(cal.reach.cbt)[cal.end.dates.indices])
T.cal.total <- rep(cutoff.date, nrow(cal.reach.cbt))
cal.dates <- data.frame(cal.start.dates, cal.end.dates, T.cal.total)

# Create calibration period customer-by-sufficient-statistic data frame,
# using weeks as the unit of time.
cal.cbs <- dc.BuildCBSFromCBTAndDates(cal.reach.cbt, cal.dates, per="week",
	cbt.is.during.cal.period=TRUE)

# Force the calibration period customer-by-sufficient-statistic to only
# 	contain repeat transactions (required by BG/BB and Pareto/NBD models)
cal.cbs[,"x"] <- cal.cbs[,"x"] - 1

holdout.start <- cutoff.date+1
holdout.end <- as.Date(colnames(fixed.holdout.reach.cbt)[ncol(fixed.holdout.reach.cbt)])
holdout.dates <- c(holdout.start, holdout.end)

# Create holdout period customer-by-sufficient-statistic data frame,
# using weeks as the unit of time.
holdout.cbs <- dc.BuildCBSFromCBTAndDates(holdout.reach.cbt, holdout.dates,
	per="week", cbt.is.during.cal.period=FALSE)

# Note the difference:
nrow(cal.cbs)            # 2357 customers
nrow(holdout.cbs)        # 684 customers

# Create a "fixed" holdout period CBS, with the same number
# of customers in the same order as the calibration period CBS
fixed.holdout.cbs <- dc.MergeCustomers(cal.cbs, holdout.cbs)
nrow(fixed.holdout.cbs)  # 2357 customers

# Furthermore, this function will assign a zero value to all fields
# that were not in the original holdout period CBS. Since T.star is the
# same for all customers in the holdout period, we should fix that:
fixed.holdout.cbs[,"T.star"] <- rep(max(fixed.holdout.cbs[,"T.star"]),nrow(fixed.holdout.cbs))



