library(imager)


### Name: common_pixsets
### Title: Various useful pixsets
### Aliases: common_pixsets px.circle px.diamond px.square px.left px.top
###   px.bottom px.right px.borders px.all px.none

### ** Examples

px.circle(20,350,350) %>% plot(interp=FALSE)
px.circle(3) %>% plot(interp=FALSE)
r <- 5
layout(t(1:3))
plot(px.circle(r,20,20))
plot(px.square(r,20,20))
plot(px.diamond(r,20,20))
#These pixsets are useful as structuring elements
px <- grayscale(boats) > .8
grow(px,px.circle(5)) %>% plot
#The following functions select pixels on the left, right, bottom, top of the image
im <- imfill(10,10)
px.left(im,3) %>% plot(int=FALSE)
px.right(im,1) %>% plot(int=FALSE)
px.top(im,4) %>% plot(int=FALSE)
px.bottom(im,2) %>% plot(int=FALSE)
#All of the above
px.borders(im,1) %>% plot(int=FALSE)



