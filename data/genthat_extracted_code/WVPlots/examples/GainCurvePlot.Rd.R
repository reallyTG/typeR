library(WVPlots)


### Name: GainCurvePlot
### Title: Plot the cumulative gain curve of a sort-order.
### Aliases: GainCurvePlot

### ** Examples


set.seed(34903490)
y = abs(rnorm(20)) + 0.1
x = abs(y + 0.5*rnorm(20))
frm = data.frame(model=x, value=y)
WVPlots::GainCurvePlot(frm, "model", "value",
   title="Example Continuous Gain Curve")




