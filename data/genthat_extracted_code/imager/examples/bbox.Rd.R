library(imager)


### Name: bbox
### Title: Compute the bounding box of a pixset
### Aliases: bbox crop.bbox

### ** Examples

im <- grayscale(boats)
px <- im > .85
plot(im)
highlight(bbox(px))
highlight(px,col="green")
crop.bbox(im,px) %>% plot



