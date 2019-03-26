library(PAWL)


### Name: binning
### Title: Class '"binning"'
### Aliases: binning-class binning binning-methods binning-method
###   binning,ANY-method show,binning-method
### Keywords: classes

### ** Examples

  showClass("binning")
  getPos <- function(points, logdensity) points
  positionbinning <- binning(position = getPos,
                        name = "position",
                        binrange = c(-4, 0),
                        ncuts = 4,
                        autobinning = TRUE,
                        useLearningRate = TRUE)



