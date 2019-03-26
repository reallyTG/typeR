library(curveDepth)


### Name: images2curves
### Title: Convert images to curves
### Aliases: images2curves

### ** Examples

library(curveDepth)
# Pixel-grid filling function for an image
plotGridImage <- function(dims){
  redDims1 <- dims[1] - 1
  redDims2 <- dims[2] - 1
  for (i in 1:(dims[1] - 1)){
    lines(c(i / redDims1 - 0.5 / redDims1,
            i / redDims1 - 0.5 / redDims1),
            c(0 - 0.5 / redDims2, 1 + 0.5 / redDims2),
            lwd = 1, lty = 3, col = "lightgray")
    lines(c(0 - 0.5 / redDims1, 1 + 0.5 / redDims1),
          c(i / redDims2 - 0.5 / redDims2,
            i / redDims2 - 0.5 / redDims2),
            lwd = 1, lty = 3, col = "lightgray")
  }
  rect(0 - 0.5 / redDims1, 0 - 0.5 / redDims2,
       1 + 0.5 / redDims1, 1 + 0.5 / redDims2)
}
# Pixel-grid filling function for a curve
plotGridCurve <- function(dims){
  for (i in 1:(dims[1] - 1)){
    lines(c(i / dims[1], i / dims[1]), c(0, 1),
          lwd = 1, lty = 3, col = "lightgray")
    lines(c(0, 1), c(i / dims[2], i / dims[2]),
          lwd = 1, lty = 3, col = "lightgray")
  }
  rect(0, 0, 1, 1)
}
# Load a digit and plot it
data("mnistShort017")
  aSevenDigit <- mnistShort017$`7`[, , 5]
image(as.matrix(rev(as.data.frame(aSevenDigit))),
      col = gray((255:0) / 256), asp = 1,
      xlim = c(0 - 1 / 27, 1 + 1 / 27),
      ylim = c(0 - 1 / 27, 1 + 1 / 27))
plotGridImage(dim(aSevenDigit)[1:2])
# Convert the digit to a curve and plot it
aSevenCurve <- images2curves(array(
  aSevenDigit, dim = c(28, 28, 1)))[[1]]
plot(cbind(aSevenCurve$coords[, 1],
           1 - aSevenCurve$coords[, 2]),
           type = "l", lwd = 3, asp = 1,
           xlim = c(0, 1), ylim = c(0, 1),
           xlab = "x", ylab = "y")
  plotGridCurve(dim(aSevenDigit)[1:2])



