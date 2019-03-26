library(MapGAM)


### Name: MAdata
### Title: Synthetic Case-Control Data for Massachusetts
### Aliases: MAdata
### Keywords: datasets

### ** Examples

data(MAdata)
summary(MAdata)
attach(MAdata)
# map participants, cases in red and controls in black
plot(Xcoord,Ycoord,col=Case+1) 



