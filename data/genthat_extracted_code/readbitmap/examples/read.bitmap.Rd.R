library(readbitmap)


### Name: read.bitmap
### Title: Read in a bitmap image in JPEG, PNG, BMP or TIFF format
### Aliases: read.bitmap

### ** Examples

img1=read.bitmap(system.file("img", "Rlogo.jpg", package="jpeg"))
str(img1)
img2 <- read.bitmap(system.file("img", "Rlogo.png", package="png"))
# nb the PNG image has an alpha channel
str(img2)



