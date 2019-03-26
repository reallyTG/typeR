library(ijtiff)


### Name: as_EBImage
### Title: Convert an ijtiff_img to an EBImage::Image.
### Aliases: as_EBImage

### ** Examples

if (require(EBImage)) {
  img <- read_tif(system.file("img", "Rlogo.tif", package = "ijtiff"))
  str(img)
  str(as_EBImage(img))
  img <- read_tif(system.file("img", "2ch_ij.tif", package = "ijtiff"))
  str(img)
  str(as_EBImage(img))
}



