library(ParetoPosStable)


### Name: plot.PPSfit
### Title: Plots to validate a Pareto Positive Stable (PPS) fit
### Aliases: plot.PPSfit

### ** Examples

data(forbes400)
fit <- PPS.fit(forbes400$NetWorth)
par(mfrow=c(2,2))
plot(fit)
dev.off()
plot(fit, which = 1, breaks = seq(0, 60, length.out = 60))



