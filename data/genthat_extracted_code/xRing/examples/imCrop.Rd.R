library(xRing)


### Name: imCrop
### Title: Crop Image Interactively
### Aliases: imCrop

### ** Examples


if(interactive()){
 file_path <-
  system.file("img", "AFO1046.1200dpi.png", package = "xRing")
  im <- imRead(file_path)
  print(dim(im))
  im_crop <- imCrop(im)
  print(dim(im_crop))
  }





