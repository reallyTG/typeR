library(ijtiff)


### Name: write_tif
### Title: Write images in TIFF format
### Aliases: write_tif

### ** Examples


img <- read_tif(system.file("img", "Rlogo.tif", package="ijtiff"))
temp_dir <- tempdir()
write_tif(img, paste0(temp_dir, "/", "Rlogo"))
img <- matrix(1:4, nrow = 2)
write_tif(img, paste0(temp_dir, "/", "tiny2x2"))
list.files(temp_dir, pattern = "tif$")




