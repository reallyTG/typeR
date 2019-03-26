library(marmap)


### Name: subsetBathy
### Title: Creates bathy objects from larger bathy objects
### Aliases: subsetBathy

### ** Examples

# load aleutians dataset
data(aleutians)

# create vectors of latitude and longitude to define the boundary of a polygon
lon <- c(188.56, 189.71, 191, 193.18, 196.18, 196.32, 196.32, 194.34, 188.83)
lat <- c(54.33, 55.88, 56.06, 55.85, 55.23, 54.19, 52.01, 50.52, 51.71)


# plot the initial bathy and overlay the polygon
plot(aleutians, image=TRUE, land=TRUE, lwd=.2)
polygon(lon,lat)

# Use of subsetBathy to extract the new bathy object
zoomed <- subsetBathy(aleutians, x=lon, y=lat, locator=FALSE)

# plot the new bathy object
dev.new() ; plot(zoomed, land=TRUE, image=TRUE, lwd=.2)

# alternativeley once the map is plotted, use the interactive mode:
## Not run: 
##D plot(aleutians, image=TRUE, land=TRUE, lwd=.2)
##D zoomed2 <- subsetBathy(aleutians, pch=19, col=3)
##D dev.new() ; plot(zoomed2, land=TRUE, image=TRUE, lwd=.2)
## End(Not run)
# click several times and press Escape




