library(imager)


### Name: distance_transform
### Title: Compute Euclidean distance function to a specified value.
### Aliases: distance_transform

### ** Examples

imd <- function(x,y) imdirac(c(100,100,1,1),x,y)
#Image is three white dots
im <- imd(20,20)+imd(40,40)+imd(80,80)
plot(im)
#How far are we from the nearest white dot? 
distance_transform(im,1) %>% plot



