library(imager)


### Name: interp
### Title: Interpolate image values
### Aliases: interp

### ** Examples


loc <- data.frame(x=runif(10,1,width(boats)),y=runif(10,1,height(boats))) #Ten random locations
interp(boats,loc)



