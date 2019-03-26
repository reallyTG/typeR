library(BTYD)


### Name: bgbb.PlotTrackingInc
### Title: BG/BB Tracking Incremental Transactions Plot
### Aliases: bgbb.PlotTrackingInc

### ** Examples

data(donationsSummary)
# donationsSummary$rf.matrix already has appropriate column names
rf.matrix <- donationsSummary$rf.matrix

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# get the annual repeat transactions
actual.inc.repeat.transactions <- donationsSummary$annual.trans

# Set appropriate x-axis
x.tickmarks <- c( "'96","'97","'98","'99","'00","'01","'02","'03","'04","'05","'06" )

# Plot actual vs. expected transactions. The calibration period was 6 periods long.
bgbb.PlotTrackingInc(est.params, rf.matrix, actual.inc.repeat.transactions, xticklab=x.tickmarks)



