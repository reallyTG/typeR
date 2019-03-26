library(FlowScreen)


### Name: mqt
### Title: Moving quantile threshold
### Aliases: mqt

### ** Examples

data(cania.sub.ts)
res <- mqt(cania.sub.ts)

# subset one year of the flow series
flow.sub <- cania.sub.ts[cania.sub.ts$year == 1990,]

# plot the 1990 observed flows in dark blue and the daily drought threshold in red
plot(flow.sub$doy, flow.sub$Flow, ylab="Q (m3/s)", xlab="Day of Year",
 pch=19, col="darkblue", type="b")
points(res, pch=19, cex=0.7, col="red")



