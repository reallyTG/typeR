library(BrailleR)


### Name: ScatterPlot
### Title: Create a standard scatter plot with a few extra elements added
###   to the output object
### Aliases: FittedLinePlot ScatterPlot plot.scatterplot
###   plot.fittedlineplot print.scatterplot print.fittedlineplot

### ** Examples

attach(airquality)
op = par(mfcol=c(3,2))
plot(Wind, Ozone, pch=4)
test1 = ScatterPlot(Wind, Ozone, pch=4)
test1 #does the plot method work?
plot(Wind, Ozone)
abline(coef(lm(Ozone~Wind)), col=4)
test2 = FittedLinePlot(Wind, Ozone, line.col=4)
test2 #does the plot method work?
par(op)
detach(airquality)
rm(test1); rm(test2); rm(op)



