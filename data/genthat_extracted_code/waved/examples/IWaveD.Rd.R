library(waved)


### Name: IWaveD
### Title: Computes the Inverse WaveD transform
### Aliases: IWaveD
### Keywords: internal

### ** Examples

library(waved)
data=waved.example(TRUE,FALSE)
lidar.w=FWaveD(data$lidar.blur,data$g)  # lidar.blur is lidar*g 
IWaveD(lidar.w)               # same as lidar



