library(FlowScreen)


### Name: screen.metric
### Title: Plot a metric with trend and change points
### Aliases: screen.metric

### ** Examples

data(cania.sub.ts)

# calculate and plot the annual maximum series
res <- pk.max(cania.sub.ts)
res1 <- screen.metric(res, ylabel="Q (m3/s)", 
text="Caniapiscau River, Annual Maximum Series")

# calculate and plot the annual minimum series
res <- MAMn(cania.sub.ts, n=1)
res1 <- screen.metric(res, ylabel="Discharge (m3/s)", 
text="Caniapiscau River, Annual Minimum Series")



