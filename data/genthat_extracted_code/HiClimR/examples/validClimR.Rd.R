library(HiClimR)


### Name: validClimR
### Title: Validation of Hierarchical Climate Regionalization
### Aliases: validClimR
### Keywords: HiClimR

### ** Examples

require(HiClimR)

## Load test case data
x <- TestCase$x

## Generate longitude and latitude mesh vectors
xGrid <- grid2D(lon = unique(TestCase$lon), lat = unique(TestCase$lat))
lon <- c(xGrid$lon)
lat <- c(xGrid$lat)

## Hierarchical Climate Regionalization
y <- HiClimR(x, lon = lon, lat = lat, lonStep = 1, latStep = 1, geogMask = FALSE, 
    continent = "Africa", meanThresh = 10, varThresh = 0, detrend = TRUE, 
    standardize = TRUE, nPC = NULL, method = "ward", hybrid = FALSE, 
    kH = NULL, members = NULL, validClimR = TRUE, k = 12, minSize = 1, 
    alpha = 0.01, plot = TRUE, colPalette = NULL, hang = -1, labels = FALSE)

## Validtion of Hierarchical Climate Regionalization
z <- validClimR(y, k = 12, minSize = 1, alpha = 0.01, plot = TRUE)

## Use a specified number of clusters (k = 12)
z <- validClimR(y, k = 12, minSize = 1, alpha = 0.01, plot = TRUE)

## Apply minimum cluster size (minSize = 25)
z <- validClimR(y, k = 12, minSize = 25, alpha = 0.01, plot = TRUE)

## The optimal number of clusters, including small clusters
k <- length(z$clustFlag)

## The selected number of clusters, after excluding small clusters (if minSize > 1)
ks <- sum(z$clustFlag)



