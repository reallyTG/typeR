library(spatstat)


### Name: disc
### Title: Circular Window
### Aliases: disc
### Keywords: spatial datagen

### ** Examples

 # unit disc
 W <- disc()
 # disc of radius 3 centred at x=10, y=5
 W <- disc(3, c(10,5))
 #
 plot(disc())
 plot(disc(mask=TRUE))
 # nice smooth circle
 plot(disc(npoly=256))
 # how to control the resolution of the mask
 plot(disc(mask=TRUE, dimyx=256))
 # check accuracy of approximation
 area(disc())/pi
 area(disc(mask=TRUE))/pi



