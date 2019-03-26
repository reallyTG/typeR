library(imager)


### Name: medianblur
### Title: Blur image with the median filter. In a window of size n x n
###   centered at pixel (x,y), compute median pixel value over the window.
###   Optionally, ignore values that are too far from the value at current
###   pixel.
### Aliases: medianblur

### ** Examples

medianblur(boats,5) %>% plot(main="Median blur, 5 pixels")
medianblur(boats,10) %>% plot(main="Median blur, 10 pixels")
medianblur(boats,10,8) %>% plot(main="Median blur, 10 pixels, threshold = 8")



