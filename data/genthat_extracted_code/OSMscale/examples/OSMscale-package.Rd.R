library(OSMscale)


### Name: OSMscale-package
### Title: Add a Scalebar to OpenStreetMap Plots
### Aliases: OSMscale-package OSMscale
### Keywords: documentation package

### ** Examples


## No test: 
 # Not tested on CRAN to avoid download time
d <- read.table(sep=",", header=TRUE, text=
"lat, long
55.685143, 12.580008
52.514464, 13.350137
50.106452, 14.419989
48.847003, 2.337213
51.505364, -0.164752")

# zoom set to 3 to speed up tests. automatic zoom determination is better.
map <- pointsMap(lat, long, data=d, type="maptoolkit-topo",
                 proj=putm(d$long), scale=FALSE, zoom=3, pch=16, col=2)
scaleBar(map, abslen=500, y=0.8, cex=0.8)
lines(projectPoints(d$lat, d$long), col="blue", lwd=2)
## End(No test)




