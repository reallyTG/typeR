library(rcosmo)


### Name: geoArea.CMBDataFrame
### Title: Geodesic area covered by a 'CMBDataFrame'
### Aliases: geoArea.CMBDataFrame

### ** Examples


## At low resolution, a few data points can
## occupy a large pixel area, e.g.:

cmbdf <- CMBDataFrame(nside = 1, spix = c(1,2,3))
pix(cmbdf)

## The total number of Healpix points at nside=1 equals 12. As cmbdf has 3 Healpix
## it occupies pi = 1/4*(surface area of unit sphere)

geoArea(cmbdf)
plot(cmbdf, size = 5, hp.boundaries = 1)




