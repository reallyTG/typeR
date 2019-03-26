library(jpeg)


### Name: writeJPEG
### Title: Write a bitmap image in JPEG format
### Aliases: writeJPEG
### Keywords: IO

### ** Examples

# read a sample file (R logo)
img <- readJPEG(system.file("img","Rlogo.jpg",package="jpeg"))
# write the image into a raw vector - using a low quality
r <- writeJPEG(img, raw(), quality=0.3)
# read it back again
img2 <- readJPEG(r)
# it will be slightly different since JPEG is a lossy format
# in particular at the low quality
max(abs(img - img2))
stopifnot(max(abs(img - img2)) < 0.4)

# try to write a native raster
img3 <- readJPEG(system.file("img","Rlogo.jpg",package="jpeg"), TRUE)
r2 <- writeJPEG(img3, raw())
img4 <- readJPEG(r2, TRUE)
# comparing nativeRaster values is not easy, so let's do write/read again
img5 <- readJPEG(writeJPEG(img4, raw()))
max(abs(img - img5))
stopifnot(max(abs(img - img5)) < 0.3)



