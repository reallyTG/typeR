library(BTYD)


### Name: spend.EstimateParameters
### Title: Spend Parameter Estimation
### Aliases: spend.EstimateParameters

### ** Examples

data(cdnowSummary)
ave.spend <- cdnowSummary$m.x
tot.trans <- cdnowSummary$cbs[,"x"]

# There will be many warnings due to the zeroes that are
# included in the data above. To avoid them, use the following:
# (see example for spend.LL)

ave.spend <- ave.spend[which(tot.trans > 0)]
tot.trans <- tot.trans[which(tot.trans > 0)]

# We will let the spend function use default starting parameters
spend.EstimateParameters(ave.spend, tot.trans)



