library(geoR)


### Name: wo
### Title: Kriging example data from Webster and Oliver
### Aliases: wo
### Keywords: datasets

### ** Examples

attach(wo)
par(mfrow=c(1,2))
plot(c(-10,130), c(-10,130), ty="n", asp=1)
points(rbind(coords, x1))
text(coords[,1], 5+coords[,2], format(data))
text(x1[1]+5, x1[2]+5, "?", col=2)
plot(c(-10,130), c(-10,130), ty="n", asp=1)
points(rbind(coords, x2))
text(coords[,1], 5+coords[,2], format(data))
text(x2[1]+5, x2[2]+5, "?", col=2)



