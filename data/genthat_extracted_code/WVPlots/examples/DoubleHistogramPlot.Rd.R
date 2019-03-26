library(WVPlots)


### Name: DoubleHistogramPlot
### Title: Plot two histograms conditioned on an outcome variable.
### Aliases: DoubleHistogramPlot

### ** Examples


set.seed(34903490)
x = rnorm(50)
y = 0.5*x^2 + 2*x + rnorm(length(x))
frm = data.frame(x=x,y=y,yC=y>=as.numeric(quantile(y,probs=0.8)))
frm$absY <- abs(frm$y)
frm$posY = frm$y > 0
frm$costX = 1
WVPlots::DoubleHistogramPlot(frm, "x", "yC", title="Example double histogram plot")




