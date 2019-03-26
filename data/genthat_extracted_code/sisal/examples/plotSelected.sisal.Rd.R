library(sisal)


### Name: plotSelected.sisal
### Title: Plotting Sets of Inputs Produced by Sequential Input Selection
### Aliases: plotSelected plotSelected.sisal plotSelected.list
### Keywords: hplot

### ** Examples

library(grDevices)
library(grid)
toy1.2 <- list(testSisal(Mtimes=10, stepsAhead=1, dataset="tsToy"),
               testSisal(Mtimes=10, stepsAhead=2, dataset="tsToy"))
## Resizing enabled:
## - mathematical expressions in titles
## - extracting the integer part of input variable names
grid.newpage()
plotSelected(toy1.2, yLabels = c("+1", "+2"),
             main = "Toy time series",
             xlab = expression(paste("input variables ",
                                     italic(y[t+l]))),
             ylab = expression(paste("output ", italic(y[t+k]))),
             pickIntPart = TRUE, intTransform = function(x) -x)
## Fixed size plot:
## - some graphical parameters adjusted
## - cex in labelPar adjusts the space around the text in table cells
## - new device the same size as the plot
grb <- plotSelected(toy1.2, resizeText = FALSE, resizeTable = FALSE,
                    axesPar = gpar(fontsize = 11, col = "red"),
                    labelPar = gpar(fontsize = 14/0.25, cex = 0.25),
                    fg = "wheat", outerRect = FALSE,
                    linePar = gpar(lty = "dashed"),
                    xAxisRot = 45, just = c("left", "top"),
                    tableArgs = list(x = 0, y = 1), draw = FALSE)
devWidth <- convertWidth(grobWidth(grb), unitTo = "inches",
                         valueOnly = TRUE)
devHeight <- convertHeight(grobHeight(grb), unitTo = "inches",
                           valueOnly = TRUE)
dev.new(width = devWidth, height = devHeight, units = "in", res = 72)
grid.draw(grb)
if (interactive()) {
    dev.set(dev.prev())
} else {
    dev.off()
}



