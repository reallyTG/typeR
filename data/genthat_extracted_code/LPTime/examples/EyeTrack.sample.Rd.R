library(LPTime)


### Name: EyeTrack.sample
### Title: EyeTrack.sample: Coordinates of eye-trajectory
### Aliases: EyeTrack.sample
### Keywords: datasets

### ** Examples

library(lattice)
data(EyeTrack.sample)

greentranslucent <- rgb(0,100,0,50,maxColorValue=255)
xyplot(y~x,data = data.frame(EyeTrack.sample),col=greentranslucent, pch=16,
     main = "Eye-trajectory",xlab = "X", ylab = "Y",
     sub = "Spatial fixation regions highlighted")




