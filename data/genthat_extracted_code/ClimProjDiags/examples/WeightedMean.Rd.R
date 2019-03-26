library(ClimProjDiags)


### Name: WeightedMean
### Title: Calculate spatial area-weighted average of multidimensional
###   arrays
### Aliases: WeightedMean

### ** Examples

##Example synthetic data 1:
data <- 1:(2 * 3 * 4 * 5)
dim(data) <- c(lon = 2, lat = 3, time = 4, model = 5)
lat <- c(1, 10, 20)
lon <- c(1, 10)

a <- WeightedMean(data = data, lon = lon, lat = lat, region = NULL, 
                 mask = NULL, londim = 1, latdim = 2)
str(a)

mask <- c(0, 1, 0, 1, 0, 1)
dim(mask) <- c(lon = 2, lat = 3)
a <- WeightedMean(data = data, lon = lon, lat = lat, region = NULL, 
                 mask = mask, londim = 1, latdim = 2)
str(a)

region <- c(1, 10, 1, 10)
a <- WeightedMean(data = data, lon = lon, lat = lat, region = region, 
                 mask = mask, londim = 1, latdim = 2)
str(a)

##Example synthetic data:
data <- 1:(2 * 3 * 4)
dim(data) <- c(lon = 2, lat = 3, time=4)
lat <- c(1, 10, 20)
lon <- c(1, 10)

a <- WeightedMean(data = data, lon = lon, lat = lat, region = NULL,
                 mask = NULL, londim = 1, latdim = 2)
str(a)



