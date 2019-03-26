library(HiClimR)


### Name: grid2D
### Title: Generate longitude and latitude grid matrices
### Aliases: grid2D
### Keywords: HiClimR

### ** Examples

require(HiClimR)

## Load test case data
x <- TestCase$x

## Generate longitude and latitude mesh vectors
xGrid <- grid2D(lon = unique(TestCase$lon), lat = unique(TestCase$lat))
lon <- c(xGrid$lon)
lat <- c(xGrid$lat)



