library(DescTools)


### Name: BubbleLegend
### Title: Add a Legend to a Bubble Plot
### Aliases: BubbleLegend
### Keywords: aplot

### ** Examples

PlotBubble(x=d.pizza$delivery_min, y=d.pizza$temperature, area=d.pizza$price,
           xlab="delivery time", ylab="temperature",
           col=SetAlpha(as.numeric(d.pizza$area)+2, .5), border="darkgrey",
           na.rm=TRUE, main="Price-Bubbles", panel.first=grid())

BubbleLegend("bottomleft", area=c(1500, 1000, 500), frame=TRUE,
             cols=SetAlpha("steelblue",0.5), bg="green",
             radius = c(1, 2.5, 5), labels=c(1500, 1000, 500), cex=0.8,
             cols.lbl=c("yellow", "red","blue"))



