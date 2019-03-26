library(riverdist)


### Name: connectsegs
### Title: Connect Segments
### Aliases: connectsegs

### ** Examples

data(Koyukuk0)
plot(Koyukuk0, ylim=c(1930500,1931500), xlim=c(194900,195100))
topologydots(Koyukuk0, add=TRUE)

Koyukuk0.1 <- connectsegs(connect=21, connectto=20, rivers=Koyukuk0)
plot(Koyukuk0.1,ylim=c(1930500,1931500), xlim=c(194900,195100))
topologydots(Koyukuk0.1, add=TRUE)

# or the vector version
zoomtoseg(seg=21:23, rivers=Koyukuk0)
Koyukuk0.2 <- connectsegs(connect=c(20,21,22), connectto=c(21,22,23), 
    nearestvert=c(FALSE,FALSE,TRUE), rivers=Koyukuk0)
zoomtoseg(seg=21:23, rivers=Koyukuk0.2)
topologydots(Koyukuk0.2, add=TRUE)



