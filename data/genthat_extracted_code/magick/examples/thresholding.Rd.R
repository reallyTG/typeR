library(magick)


### Name: thresholding
### Title: Image thresholding
### Aliases: thresholding image_threshold image_lat

### ** Examples

test <- image_convert(logo, colorspace = "Gray")
image_threshold(test, type = "black", threshold = "50%")
image_threshold(test, type = "white", threshold = "50%")

# Turn image into BW
test %>%
  image_threshold(type = "white", threshold = "50%") %>%
  image_threshold(type = "black", threshold = "50%")

# adaptive thresholding
image_lat(test, geometry = '10x10+5%')



