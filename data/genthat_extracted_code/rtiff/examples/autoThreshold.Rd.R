library(rtiff)


### Name: autoThreshold
### Title: Suggests threshold levels to use in binarizing an image channel.
### Aliases: autoThreshold
### Keywords: utilities IO file

### ** Examples

tif <- readTiff(system.file("tiff", "jello.tif", package="rtiff"))
threshold <- autoThreshold(tif@red)
plot(tif)
plot(tif@red > threshold[3])



