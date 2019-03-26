library(raster)


### Name: layerStats
### Title: Correlation and (weighted) covariance
### Aliases: layerStats

### ** Examples

b <- brick(system.file("external/rlogo.grd", package="raster"))
layerStats(b, 'pearson')

layerStats(b, 'cov')

# weigh by column number
w <- init(b, v='col')
layerStats(b, 'weighted.cov', w=w)



