library(FlowScreen)


### Name: MAMn
### Title: Calculate mean annual minimum n-day flows
### Aliases: MAMn

### ** Examples

data(cania.sub.ts)

# find the annual minimum series and plot 
res <- MAMn(cania.sub.ts, n=1)
res2 <- screen.metric(res, "Q (m3/s)")

# do the same with MAM 7-day flow instead of annual minimum
res <- MAMn(cania.sub.ts, n=7)
res2 <- screen.metric(res, "Q (m3/s)")



