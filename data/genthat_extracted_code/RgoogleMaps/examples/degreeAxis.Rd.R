library(RgoogleMaps)


### Name: degreeAxis
### Title: axis with degrees
### Aliases: degreeAxis

### ** Examples



xy = cbind(x = 2 * runif(100) - 1, y = 2 * runif(100) - 1)


plot(xy,xlim=c(-1,1),ylim=c(-1,1))


degreeAxis(1)


degreeAxis(2, at = c(-1,-0.5,0,0.5,1))





