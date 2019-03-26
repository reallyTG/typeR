library(magick)


### Name: segmentation
### Title: Image Segmentation
### Aliases: segmentation image_connect image_split image_fuzzycmeans

### ** Examples

# Split an image by color
img <- image_quantize(logo, 4)
layers <- image_split(img)
layers

# This returns the original image
image_flatten(layers)

# From the IM website
objects <- image_convert(demo_image("objects.gif"), colorspace = "Gray")
objects

# Split image in blobs of connected pixel levels
if(magick_config()$version > "6.9.0"){
objects %>%
  image_connect(connectivity = 4) %>%
  image_split()

# Fuzzy c-means
image_fuzzycmeans(logo)

logo %>%
  image_convert(colorspace = "HCL") %>%
  image_fuzzycmeans(smoothing = 5)
}



