library(OSMscale)


### Name: projectPoints
### Title: Project lat-lon points
### Aliases: projectPoints
### Keywords: spatial

### ** Examples

library("OpenStreetMap")
lat <- runif(100, 6, 12)
lon <- runif(100, 48, 58)
plot(lat,lon)
plot(projectMercator(lat,lon), main="Mercator")
plot(projectPoints(lat,lon), main="UTM32")
stopifnot(all( projectPoints(lat,lon, to=posm()) == projectMercator(lat,lon) ))

projectPoints(c(52.4,NA),      c(13.6,12.9))
projectPoints(c(52.4,NA),      c(13.6,12.9), quiet=TRUE)
projectPoints(c(52.4,52.3,NA), c(13.6,12.9,13.1))
projectPoints(c(52.4,52.3,NA), c(13.6,NA  ,13.1))
projectPoints(c(52.4,52.3,NA), c(NA  ,12.9,13.1))

# Reference system ETRS89 with GRS80-Ellipsoid (common in Germany)
set.seed(42)
d <- data.frame(N=runif(50,5734000,6115000), E=runif(50, 33189000,33458000))
d$VALUES <- berryFunctions::rescale(d$N, 20,40) + rnorm(50, sd=5)
head(d)
c1 <- projectPoints(lat=d$N, long=d$E-33e6, to=pll(),
          from=sp::CRS("+proj=utm +zone=33 +ellps=GRS80 +units=m +no_defs") )
c2 <- projectPoints(y, x, data=c1, to=posm() )
head(c1)
head(c2)

## Not run: 
##D  # not checked on CRAN because of file opening
##D map <- pointsMap(y,x, c1, plot=FALSE)
##D pdf("ETRS89.pdf")
##D par(mar=c(0,0,0,0))
##D plot(map)
##D rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4],
##D      col=berryFunctions::addAlpha("white", 0.7))
##D scaleBar(map, y=0.2, abslen=100)
##D points(c2)
##D berryFunctions::colPoints(c2$x, c2$y, d$VALUE )
##D dev.off()
##D system2("open", "ETRS89.pdf")  # on Linux, try "xdg-open"
##D #unlink("ETRS89.pdf")
## End(Not run)




