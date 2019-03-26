library(BTYD)


### Name: pnbd.ExpectedCumulativeTransactions
### Title: Pareto/NBD Expected Cumulative Transactions
### Aliases: pnbd.ExpectedCumulativeTransactions

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

params <- c(0.55, 10.56, 0.61, 11.64)

# Returns a vector containing cumulative repeat transactions for 546 days.
# All parameters are in weeks; the calibration period lasted 39 weeks
# and the holdout period another 39.
pnbd.ExpectedCumulativeTransactions(params, T.cal=cal.cbs[,"T.cal"],
	T.tot=78, n.periods.final=546)



