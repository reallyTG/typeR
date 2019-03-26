library(dtwSat)


### Name: plotCostMatrix
### Title: Plotting paths
### Aliases: plotCostMatrix

### ** Examples

log_fun = logisticWeight(-0.1, 100)
ts = twdtwTimeSeries(MOD13Q1.ts.list)
patt = twdtwTimeSeries(MOD13Q1.patterns.list)
mat1 = twdtwApply(x=ts, y=patt, weight.fun=log_fun, keep=TRUE)

plotCostMatrix(mat1, matrix.name="costMatrix")

plotCostMatrix(mat1, matrix.name="localMatrix")

plotCostMatrix(mat1, matrix.name="timeWeight")




