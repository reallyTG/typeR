library(tiff)


### Name: writeTIFF
### Title: Write one or more bitmap images in TIFF format
### Aliases: writeTIFF
### Keywords: IO

### ** Examples

img <- readTIFF(system.file("img", "Rlogo.tiff", package="tiff"))
# write without the alpha channel
tiff <- writeTIFF(img[,,-4], raw(0))
# read as native
i2 <- readTIFF(tiff, native=TRUE)
# write reduced - should be the same as tiff
t2 <- writeTIFF(i2, raw(0), reduce=TRUE)



