library(marmap)


### Name: dist2isobath
### Title: Computes the shortest great circle distance between any point
###   and a given isobath
### Aliases: dist2isobath

### ** Examples

# Load NW Atlantic data and convert to class bathy
data(nw.atlantic)
atl <- as.bathy(nw.atlantic)

# Create vectors of latitude and longitude
lon <- c(-70, -65, -63, -55, -48)
lat <- c(33, 35, 40, 37, 33)

# Compute distances between each point and the -200m isobath
d <- dist2isobath(atl, lon, lat, isobath = -200)
d

# Visualize the great circle distances
blues <- c("lightsteelblue4","lightsteelblue3","lightsteelblue2","lightsteelblue1")
plot(atl, image=TRUE, lwd=0.1, land=TRUE, bpal = list(c(0,max(atl),"grey"), c(min(atl),0,blues)))
plot(atl, deep=-200, shallow=-200, step=0, lwd=0.6, add=TRUE)
points(lon,lat, pch=21, col="orange4", bg="orange2", cex=.8)
linesGC(d[2:3],d[4:5])



