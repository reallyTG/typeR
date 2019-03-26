library(oce)


### Name: plot,section-method
### Title: Plot a Section
### Aliases: plot,section-method plot.section

### ** Examples

library(oce)
data(section)
sg <- sectionGrid(section)

## 1. start of section, default fields.
plot(head(section))

## 2. Gulf Stream
GS <- subset(section, 109<=stationId&stationId<=129)
GSg <- sectionGrid(GS, p=seq(0, 2000, 100))
plot(GSg, which=c(1, 99), map.ylim=c(34, 42))
par(mfrow=c(2, 1))
plot(GS, which=1, ylim=c(2000, 0), ztype='points',
     zbreaks=seq(0,30,2), pch=20, cex=3)
plot(GSg, which=1, ztype='image', zbreaks=seq(0,30,2))

par(mfrow=c(1, 1))

## 3. Image, with colored dots to indicate grid-data mismatch.
## Not run: 
##D plot(GSg, which=1, ztype='image')
##D T <- GS[['temperature']]
##D col <- oceColorsJet(100)[rescale(T, rlow=1, rhigh=100)]
##D points(GS[['distance']],GS[['depth']],pch=20,cex=3,col='white')
##D points(GS[['distance']],GS[['depth']],pch=20,cex=2.5,col=col)
## End(Not run)


## Not run: 
##D ## 4. Image of Absolute Salinity, with 4-minute bathymetry
##D ## It's easy to calculate the desired area for the bathymetry,
##D ## but for brevity we'll hard-code it. Note that download.topo()
##D ## caches the file locally.
##D f <- download.topo(west=-80, east=0, south=35, north=40, resolution=4)
##D t <- read.topo(f)
##D plot(section, which="SA", xtype="longitude", ztype="image", showBottom=t)
## End(Not run)

## Not run: 
##D ## 5. Temperature with salinity added in red
##D s <- plot(section, which="temperature")
##D distance <- s[["distance", "byStation"]]
##D depth <- s[["station", 1]][["depth"]]
##D salinity <- matrix(s[["salinity"]], byrow=TRUE, nrow=length(s[["station"]]))
##D contour(distance, depth, salinity, col=2, add=TRUE)
## End(Not run)




