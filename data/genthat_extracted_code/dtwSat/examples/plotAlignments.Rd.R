library(dtwSat)


### Name: plotAlignments
### Title: Plotting alignments
### Aliases: plotAlignments

### ** Examples

log_fun = logisticWeight(-0.1, 100)
ts = twdtwTimeSeries(MOD13Q1.ts.list)
patt = twdtwTimeSeries(MOD13Q1.patterns.list)
mat1 = twdtwApply(x=ts, y=patt, weight.fun=log_fun)

plotAlignments(mat1)

plotAlignments(mat1, attr=c("evi","ndvi"))




