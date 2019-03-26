library(WVPlots)


### Name: GainCurvePlotWithNotation
### Title: Plot the cumulative gain curve of a sort-order with extra
###   notation
### Aliases: GainCurvePlotWithNotation

### ** Examples


set.seed(34903490)
y = abs(rnorm(20)) + 0.1
x = abs(y + 0.5*rnorm(20))
frm = data.frame(model=x, value=y)
gainx = 0.10  # get the top 10% most valuable points as sorted by the model
# make a function to calculate the label for the annotated point
labelfun = function(gx, gy) {
  pctx = gx*100
  pcty = gy*100

  paste("The top ", pctx, "% most valuable points by the model\n",
        "are ", pcty, "% of total actual value", sep='')
}
WVPlots::GainCurvePlotWithNotation(frm, "model", "value",
   title="Example Gain Curve with annotation",
   gainx=gainx,labelfun=labelfun)




