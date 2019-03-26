library(tiff)


### Name: readTIFF
### Title: Read a bitmap image stored in the TIFF format
### Aliases: readTIFF
### Keywords: IO

### ** Examples

# read a sample file (R logo)
img <- readTIFF(system.file("img", "Rlogo.tiff", package="tiff"))

# read it also in native format
img.n <- readTIFF(system.file("img", "Rlogo.tiff", package="tiff"), native=TRUE)

# and also in converted
img.c <- readTIFF(system.file("img", "Rlogo.tiff", package="tiff"), convert=TRUE)

# if your R supports it, we'll plot it
if (exists("rasterImage")) { # can plot only in R 2.11.0 and higher
  plot(1:2, type='n')

  if (names(dev.cur()) == "windows") {
    # windows device doesn't support semi-transparency so we'll need
    # to flatten the image
    transparent <- img[,,4] == 0
    img <- as.raster(img[,,1:3])
    img[transparent] <- NA

    # interpolate must be FALSE on Windows, otherwise R will
    # try to interpolate transparency and fail
    rasterImage(img, 1.2, 1.27, 1.8, 1.73, interpolate=FALSE)

  } else {
    # any reasonable device will be fine using alpha
    rasterImage(img, 1.2, 1.27, 1.8, 1.73)
    rasterImage(img.n, 1.5, 1.5, 1.9, 1.8)
  }
}



