library(imager)


### Name: colorise
### Title: Fill in a colour in an area given by a pixset
### Aliases: colorise

### ** Examples

im <- load.example("coins")
colorise(im,Xc(im) < 50,"blue") %>% plot
#Same thing with the formula interface
colorise(im,~ x < 50,"blue") %>% plot
#Add transparency
colorise(im,~ x < 50,"blue",alpha=.5) %>% plot
#Highlight pixels with low luminance values
colorise(im,~ . < 0.3,"blue",alpha=.2) %>% plot



