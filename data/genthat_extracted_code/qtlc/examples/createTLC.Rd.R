library(qtlc)


### Name: createTLC
### Title: Creates TLC S3 object
### Aliases: createTLC
### Keywords: array device

### ** Examples

#Creates test matrix.
# RGB channels stay separated, or
# intensities are combined.
fname01 <- system.file("extdata", "testTIFF.tiff", package="qtlc")
testTLC <- createTLC(fname01, RGB=TRUE)
print(testTLC)




