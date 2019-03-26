library(curveDepth)


### Name: dist.images
### Title: Distance for images
### Aliases: dist.images

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
# Load two Sevens and one One, and plot them
data("mnistShort017")
# First Seven
  firstSevenDigit <- mnistShort017$`7`[, , 5]
image(as.matrix(rev(as.data.frame(firstSevenDigit))),
      col = gray((255:0) / 256), asp = 1,
      xlim = c(0 - 1 / 27, 1 + 1 / 27),
      ylim = c(0 - 1 / 27, 1 + 1 / 27))
plotGridImage(dim(firstSevenDigit)[1:2])
# Second Seven
secondSevenDigit <- mnistShort017$`7`[, , 6]
image(as.matrix(rev(as.data.frame(secondSevenDigit))),
      col = gray((255:0) / 256), asp = 1,
      xlim = c(0 - 1 / 27, 1 + 1 / 27),
      ylim = c(0 - 1 / 27, 1 + 1 / 27))
plotGridImage(dim(secondSevenDigit)[1:2])
# A One
aOneDigit <- mnistShort017$`1`[, , 1]
image(as.matrix(rev(as.data.frame(aOneDigit))),
      col = gray((255:0) / 256), asp = 1,
      xlim = c(0 - 1 / 27, 1 + 1 / 27),
      ylim = c(0 - 1 / 27, 1 + 1 / 27))
plotGridImage(dim(aOneDigit)[1:2])
# Caculate distances between all the images
distMatrix <- dist.images(
  abind(firstSevenDigit, secondSevenDigit, aOneDigit,
        along = 3))
# Print distance matrix
print(distMatrix)



