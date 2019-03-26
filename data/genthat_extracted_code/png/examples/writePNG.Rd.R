library(png)


### Name: writePNG
### Title: Write a bitmap image in PNG format
### Aliases: writePNG
### Keywords: IO

### ** Examples

# read a sample file (R logo)
img <- readPNG(system.file("img","Rlogo.png",package="png"))
# write the image into a raw vector
r <- writePNG(img)
# read it back again
img2 <- readPNG(r)
# it better be the same
identical(img, img2)
# try to write a native raster
img3 <- readPNG(system.file("img","Rlogo.png",package="png"), TRUE)
r2 <- writePNG(img3)
img4 <- readPNG(r2, TRUE)
identical(img3, img4)

## text and metadata
r <- writePNG(img, text=c(source=R.version.string),
     metadata=sessionInfo())
img5 <- readPNG(r, info=TRUE)
attr(img5, "info")
attr(img5, "metadata")



