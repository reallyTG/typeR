library(FlowScreen)


### Name: Qn
### Title: Calculate flow quantiles
### Aliases: Qn

### ** Examples

data(cania.sub.ts)

# 50% quantile, i.e. mean, by calendar year
res <- Qn(cania.sub.ts, n=0.5, by="year")
res2 <- screen.metric(res, "Q (m3/s)")

# Default 10% quantile, by hydrologic year
res <- Qn(cania.sub.ts)
res2 <- screen.metric(res, "Q (m3/s)")



