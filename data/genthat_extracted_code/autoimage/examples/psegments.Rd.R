library(autoimage)


### Name: psegments
### Title: Projected segments function
### Aliases: psegments

### ** Examples

data(narccap)
# plot image using bonne projection (w/o grid lines)
pimage(lon, lat, tasmax[,,1], proj = "bonne",
       parameters = 40, paxes.args = list(grid = FALSE))
# some locations for u.s. cities
# taken from data(us.cities, package = "maps")
boston <- c(-71.02, 42.34)
la <- c(-118.41, 34.11)
ny <- c(-73.94, 40.67)
sf <- c(-122.45, 37.77)
# plot segments between sf, la and ny boston
x0 <- c(sf[1], ny[1])
y0 <- c(sf[2], ny[2])
x1 <- c(la[1], boston[1])
y1 <- c(la[2], boston[2])
psegments(x0, y0, x1, y1, proj = "bonne", lwd = 3)
citycoords <- rbind(sf, la, ny, boston)
cityxy <- list(x = citycoords[,1], y = citycoords[,2])
citynames <- c("san francisco", "los angeles", "new york", "boston") 
ptext(cityxy, labels = citynames, proj = 'bonne')



