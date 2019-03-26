library(TOC)


### Name: plot
### Title: Plot an object of class Toc or Roc
### Aliases: plot plot,Toc-method plot,Roc-method
### Keywords: methods spatial

### ** Examples

index <- raster(system.file("external/Prob_Map2.rst", package = "TOC"))
boolean <- raster(system.file("external/Change_Map2b.rst", package = "TOC"))
mask <- raster(system.file("external/MASK4.rst", package="TOC"))

## create and plot the TOC curve
tocd <- TOC(index, boolean, mask, nthres = 100)
plot(tocd, main = "TOC curve")

## create and plot the ROC curve
rocd <- ROC(index, boolean, mask, nthres = 100)
plot(rocd, main = "ROC curve")

## label the thresholds in the plot
tocd <- TOC(index, boolean, mask, nthres = 10)
plot(tocd, labelThres = TRUE, cex = 0.8, posL = 4)



