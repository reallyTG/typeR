library(rtiff)


### Name: writeTiff
### Title: A function to load TIFF images into a pixmap.
### Aliases: writeTiff
### Keywords: utilities IO file

### ** Examples

tif <- readTiff(system.file("tiff", "jello.tif", package="rtiff"))
writeTiff(tif@red, "atesttif.tif")



