library(imager)


### Name: patch_summary_cimg
### Title: Extract a numerical summary from image patches, using CImg's
###   mini-language Experimental feature.
### Aliases: patch_summary_cimg

### ** Examples

#Example: median filtering using patch_summary_cimg
#Center a patch at each pixel
im <- grayscale(boats)
patches <- pixel.grid(im)  %>% dplyr::mutate(w=3,h=3)
#Extract patch summary
out <- dplyr::mutate(patches,med=patch_summary_cimg(im,"ic",x,y,w,h))
as.cimg(out,v.name="med") %>% plot



