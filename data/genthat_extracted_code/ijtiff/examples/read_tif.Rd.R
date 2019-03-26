library(ijtiff)


### Name: read_tif
### Title: Read an image stored in the TIFF format
### Aliases: read_tif

### ** Examples

img <- read_tif(system.file("img", "Rlogo.tif", package = "ijtiff"))
img <- read_tif(system.file("img", "2ch_ij.tif", package = "ijtiff"))
str(img)  # we see that `ijtiff` correctly recognises this image's 2 channels




