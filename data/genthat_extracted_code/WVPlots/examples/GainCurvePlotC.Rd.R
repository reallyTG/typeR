library(WVPlots)


### Name: GainCurvePlotC
### Title: Plot the cumulative gain curve of a sort-order with costs.
### Aliases: GainCurvePlotC

### ** Examples


set.seed(34903490)
y = abs(rnorm(20)) + 0.1
x = abs(y + 0.5*rnorm(20))
frm = data.frame(model=x, value=y)
frm$costs=1
frm$costs[1]=5
WVPlots::GainCurvePlotC(frm, "model", "costs", "value",
   title="Example Continuous Gain CurveC")




