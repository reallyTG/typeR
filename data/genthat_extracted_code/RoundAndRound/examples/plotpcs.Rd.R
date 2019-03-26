library(RoundAndRound)


### Name: plotpcs
### Title: Plot in polar coordinate system
### Aliases: plotpcs

### ** Examples


n=50
par(mfrow=c(2,1))
plotpcs(theta = 1:n * 15, a=1:n/10, ab=1, type='l', asp=1)
plotpcs(theta = 1:n * 10, a=1:n/10, ab=1, type='l', asp=1)
xy = PCS2CCS(theta = 1:n * 10, a=1:n/10, ab=1)
xy[,1]=xy[,1]+1
points(xy, pch=19, col=terrain.colors(nrow(xy)))




