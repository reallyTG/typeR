library(imager)


### Name: inpaint
### Title: Fill-in NA values in an image
### Aliases: inpaint

### ** Examples

im <- boats
im[sample(nPix(im),1e4)] <- NA
inpaint(im,1) %>% imlist(im,.) %>%
   setNames(c("before","after")) %>% plot(layout="row")



