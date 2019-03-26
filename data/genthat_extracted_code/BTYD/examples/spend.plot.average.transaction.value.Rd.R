library(BTYD)


### Name: spend.plot.average.transaction.value
### Title: Plot Actual vs. Expected Average Transaction Value
### Aliases: spend.plot.average.transaction.value

### ** Examples

data(cdnowSummary)
ave.spend <- cdnowSummary$m.x
tot.trans <- cdnowSummary$cbs[,"x"]
params <- c(6.25, 3.74, 15.44)

# Plot the actual and expected average transaction value across customers.
f.m.x <- spend.plot.average.transaction.value(params, ave.spend, tot.trans)



