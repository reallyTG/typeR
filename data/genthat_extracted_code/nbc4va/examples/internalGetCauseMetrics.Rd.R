library(nbc4va)


### Name: internalGetCauseMetrics
### Title: Calculate performance metrics table per cause
### Aliases: internalGetCauseMetrics
### Keywords: internal

### ** Examples

library(nbc4va)
pred <- c("HIV", "Stroke", "HIV", "Stroke")
obs <- c("HIV", "HIV", "Stroke", "Stroke")
cmetrics <- nbc4va:::internalGetCauseMetrics(pred, obs)




