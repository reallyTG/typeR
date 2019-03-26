library(spatstat.data)


### Name: waka
### Title: Trees in Waka national park
### Aliases: waka
### Keywords: datasets spatial

### ** Examples

data(waka)
  if(require(spatstat)) {
plot(waka, markscale=0.01)
title(sub="Tree diameters to scale")
plot(waka, markscale=0.04)
title(sub="Tree diameters 4x scale")
   }



