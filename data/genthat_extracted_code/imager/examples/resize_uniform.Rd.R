library(imager)


### Name: resize_doubleXY
### Title: Resize image uniformly
### Aliases: resize_doubleXY resize_halfXY resize_tripleXY resize_uniform
###   imresize

### ** Examples

im <- load.example("parrots")
imresize(im,1/4) #Quarter size
map_il(2:4,~ imresize(im,1/.)) %>% imappend("x") %>% plot



