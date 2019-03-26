library(latticeExtra)


### Name: panel.scaleArrow
### Title: Draw a scale bar as an arrow, labelled with its length in plot
###   units.
### Aliases: panel.scaleArrow
### Keywords: aplot

### ** Examples

xyplot(EuStockMarkets) +
  layer(panel.scaleArrow(x = 0.99, append = " units",
          col = "grey", srt = 90, cex = 0.8))



