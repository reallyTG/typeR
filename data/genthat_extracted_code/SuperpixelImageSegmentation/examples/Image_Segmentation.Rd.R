library(SuperpixelImageSegmentation)


### Name: Image_Segmentation
### Title: Segmentation of images based on Superpixels, Affinity
###   propagation and Kmeans clustering
### Aliases: Image_Segmentation
### Keywords: datasets

### ** Examples


library(SuperpixelImageSegmentation)

path = system.file("images", "BSR_bsds500_image.jpg", package = "SuperpixelImageSegmentation")

im = OpenImageR::readImage(path)

init = Image_Segmentation$new()

num_spix = 10           # for illustration purposes
# num_spix = 600        # recommended number of superpixels

spx = init$spixel_segmentation(input_image = im, 
                               superpixel = num_spix, 
                               AP_data = TRUE,
                               use_median = TRUE, 
                               sim_color_radius = 10)

## Not run: 
##D plt_im = init$spixel_masks_show(display_all = TRUE)
## End(Not run)



