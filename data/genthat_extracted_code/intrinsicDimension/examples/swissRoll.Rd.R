library(intrinsicDimension)


### Name: swissRoll
### Title: Swiss roll with or without 3-sphere inside
### Aliases: swissRoll swissRoll3Sph
### Keywords: datagen

### ** Examples

datap <- swissRoll3Sph(300, 100)
par(mfrow = c(1, 3))
plot(datap[,1], datap[,2])
plot(datap[,1], datap[,3])
plot(datap[,1], datap[,4])



