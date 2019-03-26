library(waved)


### Name: multires
### Title: Create Multi-resolution Plot
### Aliases: multires
### Keywords: internal

### ** Examples

library(waved)
data=waved.example(TRUE,FALSE)
lidar.w=FWaveD(data$lidar.blur,data$g,F=7)
multires(lidar.w,lo=3,hi=7)



