library(imager)


### Name: correlate
### Title: Correlation/convolution of image by filter
### Aliases: correlate convolve

### ** Examples

#Edge filter
filter <- as.cimg(function(x,y) sign(x-5),10,10) 
layout(t(1:2))
#Convolution vs. correlation 
correlate(boats,filter) %>% plot(main="Correlation")
convolve(boats,filter) %>% plot(main="Convolution")



