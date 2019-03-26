library(marmap)


### Name: irregular
### Title: Irregularly spaced bathymetric data.
### Aliases: irregular

### ** Examples

# load data
data(irregular)

# use griddify
reg <- griddify(irregular, nlon = 40, nlat = 60)

# switch to class "bathy"
class(reg)
bat <- as.bathy(reg)
summary(bat)

# Plot the new bathy object along with the original data
plot(bat, image = TRUE, lwd = 0.1)
points(irregular$lon, irregular$lat, pch = 19, cex = 0.3, col = col2alpha(3))



