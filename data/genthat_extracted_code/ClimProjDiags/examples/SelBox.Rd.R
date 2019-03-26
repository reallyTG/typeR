library(ClimProjDiags)


### Name: SelBox
### Title: Select apatial region from multidimensional arrays
### Aliases: SelBox

### ** Examples

## Example with synthetic data:
data <- 1:(20 * 3 * 2 * 4)
dim(data) <- c(lon = 20, lat = 3, time = 2, model = 4)
lon <- seq(2, 40, 2)
lat <- c(1, 5, 10)

a <- SelBox(data = data, lon = lon, lat = lat, region = c(2, 20, 1, 5), 
           londim = 1, latdim = 2, mask = NULL)
str(a)



