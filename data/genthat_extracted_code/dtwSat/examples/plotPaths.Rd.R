library(dtwSat)


### Name: plotPaths
### Title: Plotting paths
### Aliases: plotPaths

### ** Examples

log_fun = logisticWeight(-0.1, 100)
ts = twdtwTimeSeries(MOD13Q1.ts.list)
patt = twdtwTimeSeries(MOD13Q1.patterns.list)
mat1 = twdtwApply(x=ts, y=patt, weight.fun=log_fun, keep=TRUE)

plotPaths(mat1)

plotPaths(mat1, patterns.labels="Soybean", k=1:2)

plotPaths(mat1, patterns.labels=c("Maize","Cotton"), k=2)




