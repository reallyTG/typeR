library(qtlc)


### Name: matrixtoimage
### Title: Converts matrix back to image
### Aliases: matrixtoimage

### ** Examples

# Converts test image to matrix,
# then matrix back to image.
fname01 <- system.file("extdata", "testTIFF.tiff", package="qtlc")
testTLC <- createTLC(fname01, RGB=FALSE)
print(testTLC)
matrixtoimage(testTLC, bkg="white")




