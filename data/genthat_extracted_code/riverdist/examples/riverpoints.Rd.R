library(riverdist)


### Name: riverpoints
### Title: Draw Points from River Locations
### Aliases: riverpoints

### ** Examples

data(fakefish,Gulk)

plot(x=Gulk, xlim=c(862000,882000), ylim=c(6978000,6993000))
points(x=fakefish$x, y=fakefish$y, pch=16, col=2)
riverpoints(seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk, pch=15, col=4)

plot(x=Gulk, empty=TRUE)
with(fakefish, riverpoints(seg=seg, vert=vert, rivers=Gulk, 
       pch=16, col=flight, jitter=1000))



