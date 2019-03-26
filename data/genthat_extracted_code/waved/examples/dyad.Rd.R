library(waved)


### Name: dyad
### Title: Dyadic band
### Aliases: dyad
### Keywords: internal

### ** Examples

library(waved)
data=waved.example(TRUE,FALSE)
lidar.w=FWaveD(data$lidar.blur,data$g)
lidar.w[dyad(7)]



