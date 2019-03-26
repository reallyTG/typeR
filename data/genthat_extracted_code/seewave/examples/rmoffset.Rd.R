library(seewave)


### Name: rmoffset
### Title: Remove the offset of a time wave
### Aliases: rmoffset
### Keywords: dplot ts

### ** Examples

data(tico)
# artifically generates an offset
tico2<-tico+0.1
# see the wave with an offset
oscillo(tico2, f=22050)
# remove the offset with the mean (by default)
rmoffset(tico2, f=22050, plot=TRUE)
# remove the offset with the median
rmoffset(tico2, f=22050, FUN=median, plot=TRUE)



