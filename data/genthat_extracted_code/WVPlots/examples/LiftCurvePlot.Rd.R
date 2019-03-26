library(WVPlots)


### Name: LiftCurvePlot
### Title: Plot the cumulative lift curve of a sort-order.
### Aliases: LiftCurvePlot

### ** Examples


set.seed(34903490)
y = abs(rnorm(20)) + 0.1
x = abs(y + 0.5*rnorm(20))
frm = data.frame(model=x, value=y)
WVPlots::LiftCurvePlot(frm, "model", "value",
   title="Example Continuous Lift Curve")




