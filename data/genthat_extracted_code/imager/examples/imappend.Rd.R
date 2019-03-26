library(imager)


### Name: imappend
### Title: Combine a list of images into a single image
### Aliases: imappend

### ** Examples

imappend(list(boats,boats),"x") %>% plot
imappend(list(boats,boats),"y") %>% plot
plyr::rlply(3,imnoise(100,100)) %>% imappend("c") %>% plot
boats.gs <- grayscale(boats)
plyr::llply(seq(1,5,l=3),function(v) isoblur(boats.gs,v)) %>% imappend("c") %>% plot
#imappend also works on pixsets
imsplit(boats > .5,"c") %>% imappend("x") %>% plot



