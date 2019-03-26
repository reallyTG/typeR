library(BTYD)


### Name: bgnbd.ExpectedCumulativeTransactions
### Title: BG/NBD Expected Cumulative Transactions
### Aliases: bgnbd.ExpectedCumulativeTransactions

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

params <- c(0.243, 4.414, 0.793, 2.426)

# Returns a vector containing cumulative repeat transactions for 273 days.
# All parameters are in weeks; the calibration period lasted 39 weeks.
bgnbd.ExpectedCumulativeTransactions(params, T.cal=cal.cbs[,"T.cal"], T.tot=39, n.periods.final=273)



