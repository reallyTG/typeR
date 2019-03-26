library(marmap)


### Name: griddify
### Title: Fill a grid with irregularly spaced data
### Aliases: griddify

### ** Examples

# load irregularly spaced xyz data
data(irregular)
head(irregular)

# use griddify to create a 40x60 grid
reg <- griddify(irregular, nlon = 40, nlat = 60)

# switch to class "bathy"
class(reg)
bat <- as.bathy(reg)
summary(bat)

# Plot the new bathy object and overlay the original data points
plot(bat, image = TRUE, lwd = 0.1)
points(irregular$lon, irregular$lat, pch = 19, cex = 0.3, col = col2alpha(3))



