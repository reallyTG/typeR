library(rtiff)


### Name: rtiff-package
### Title: A tiff reader for R.
### Aliases: rtiff-package rtiff
### Keywords: IO

### ** Examples

library(rtiff)
tif <- readTiff(system.file("tiff", "jello.tif", package="rtiff"))
plot(tif)


plot(tif@blue)

plot(tif@blue > autoThreshold(tif@blue)[3])




