library(POT)


### Name: Profiled Confidence Intervals
### Title: Profiled Confidence interval for the GP Distribution
### Aliases: gpd.pfshape gpd.pfscale gpd.pfrl
### Keywords: htest

### ** Examples

data(ardieres)
events <- clust(ardieres, u = 4, tim.cond = 8 / 365,
clust.max = TRUE)
MLE <- fitgpd(events[, "obs"], 4, 'mle')
gpd.pfshape(MLE, c(0, 0.8))
rp2prob(10, 2)
gpd.pfrl(MLE, 0.95, c(12, 25))



