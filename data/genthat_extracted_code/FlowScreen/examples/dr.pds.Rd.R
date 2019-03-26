library(FlowScreen)


### Name: dr.pds
### Title: Get the partial duration series for streamflow droughts
### Aliases: dr.pds

### ** Examples

data(cania.sub.ts)
pds <- dr.pds(cania.sub.ts)
pds <- subset(pds, pds$BelowThresh==TRUE)

# plot the flow time series with black and the drought events in red
plot(cania.sub.ts$Date, cania.sub.ts$Flow, ylab="m3/s", xlab="", type="l")
points(pds$Date, pds$Flow, pch=19, cex=0.7, col="red")



