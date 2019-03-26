library(OpenImageR)


### Name: superpixels
### Title: SLIC and SLICO superpixel implementations
### Aliases: superpixels

### ** Examples


library(OpenImageR)

path = system.file("tmp_images", "slic_im.png", package = "OpenImageR")

im = readImage(path)

res = superpixels(input_image = im, method = "slic", superpixel = 200, 

                  compactness = 20, return_slic_data = TRUE)




