library(mapplots)


### Name: ices.rect
### Title: Convert ICES rectangles from or to geographical coordinates
### Aliases: ices.rect ices.rect2

### ** Examples

# rectangle names to coordinates:
ices.rect(c("36E2","3600","40D8"))

# coordinates to rectangle names:
lon <- rnorm(10,-10,2)
lat <- rnorm(10,53,1)
rect <- ices.rect2(lon,lat)
basemap(xlim=range(lon), ylim=range(lat) )
draw.rect()
points(lon,lat)
text(lon,lat,rect,cex=0.7,pos=3)



