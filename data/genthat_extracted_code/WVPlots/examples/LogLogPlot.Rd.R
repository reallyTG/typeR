library(WVPlots)


### Name: LogLogPlot
### Title: Log-log plot
### Aliases: LogLogPlot

### ** Examples


set.seed(5326)
frm = data.frame(x = 1:20)
frm$y <- 5 + frm$x + 0.2 * frm$x * frm$x + 0.1*abs(rnorm(nrow(frm)))
WVPlots::LogLogPlot(frm, "x", "y", title="Example Trend")




