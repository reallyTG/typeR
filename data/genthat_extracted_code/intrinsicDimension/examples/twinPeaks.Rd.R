library(intrinsicDimension)


### Name: twinPeaks
### Title: Twin Peaks
### Aliases: twinPeaks hyperTwinPeaks
### Keywords: datagen

### ** Examples

datap <- twinPeaks(400)
par(mfrow = c(1, 3))
plot(datap[,1], datap[,3])
plot(datap[,2], datap[,3])
plot(datap[,1], datap[,2])



