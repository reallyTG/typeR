library(imager)


### Name: at
### Title: Return or set pixel value at coordinates
### Aliases: at at<- color.at color.at<-

### ** Examples

im <- as.cimg(function(x,y) x+y,50,50)
at(im,10,1)
at(im,10:12,1)
at(im,10:12,1:3)
at(im,1,2) <- 10
at(im,1,2)
color.at(boats,x=10,y=10)
im <- boats
color.at(im,x=10,y=10) <- c(255,0,0)
#There should now be a red dot
imsub(im, x %inr% c(1,100), y %inr% c(1,100)) %>% plot



