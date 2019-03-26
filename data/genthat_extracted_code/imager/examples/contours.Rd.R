library(imager)


### Name: contours
### Title: Return contours of image/pixset
### Aliases: contours

### ** Examples

boats.gs <- grayscale(boats)
ct <- contours(boats.gs,nlevels=3)
plot(boats.gs)
#Add contour lines
purrr::walk(ct,function(v) lines(v$x,v$y,col="red"))
#Contours of a pixel set
px <- boats.gs > .8
plot(boats.gs)
ct <- contours(px)
#Highlight pixset
purrr::walk(ct,function(v) lines(v$x,v$y,col="red"))



