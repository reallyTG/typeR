library(dtwSat)


### Name: plotClassification
### Title: Plotting subintervals classification
### Aliases: plotClassification

### ** Examples

log_fun = logisticWeight(-0.1, 100)
ts = twdtwTimeSeries(MOD13Q1.ts.list)
patt = twdtwTimeSeries(MOD13Q1.patterns.list)
mat1 = twdtwApply(x=ts, y=patt, weight.fun=log_fun)

# Classify interval
from = as.Date("2007-09-01")
to = as.Date("2013-09-01")
by = "6 month"
gp = plotClassification(x=mat1, from=from, to=to, by=by, overlap=.5)
gp





