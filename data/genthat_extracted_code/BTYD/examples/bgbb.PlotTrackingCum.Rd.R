library(BTYD)


### Name: bgbb.PlotTrackingCum
### Title: BG/BB Tracking Cumulative Transactions Plot
### Aliases: bgbb.PlotTrackingCum

### ** Examples

data(donationsSummary)
# donationsSummary$rf.matrix already has appropriate column names
rf.matrix <- donationsSummary$rf.matrix

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# get the annual repeat transactions, and transform them into
# a cumulative form
actual.inc.repeat.transactions <- donationsSummary$annual.trans
actual.cum.repeat.transactions <- cumsum(actual.inc.repeat.transactions)

# set appropriate x-axis
x.tickmarks <- c( "'96","'97","'98","'99","'00","'01","'02","'03","'04","'05","'06" )

# plot actual vs. expected transactions. The calibration period was 6 periods long.
bgbb.PlotTrackingCum(est.params, rf.matrix, actual.cum.repeat.transactions, xticklab=x.tickmarks)



