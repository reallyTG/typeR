library(dtwSat)


### Name: plotMatches
### Title: Plotting matching points
### Aliases: plotMatches

### ** Examples

log_fun = logisticWeight(-0.1, 100)
ts = twdtwTimeSeries(MOD13Q1.ts.list)
patt = twdtwTimeSeries(MOD13Q1.patterns.list)
mat1 = twdtwApply(x=ts, y=patt, weight.fun=log_fun, keep=TRUE)

plotMatches(mat1)

plotMatches(mat1, patterns.labels="Soybean", k=4)

plotMatches(mat1, patterns.labels=c("Soybean","Maize"), k=4)

plotMatches(mat1, patterns.labels=c("Soybean","Cotton"), k=c(3,1))




