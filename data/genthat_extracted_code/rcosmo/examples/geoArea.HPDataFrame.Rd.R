library(rcosmo)


### Name: geoArea.HPDataFrame
### Title: Geodesic area covered by a 'HPDataFrame'
### Aliases: geoArea.HPDataFrame

### ** Examples


## Generate random I for HPDataFrame
hp1 <- HPDataFrame(I=rnorm(5), nside = 1, spix = c(1,1,2,2,3))
pix(hp1)

## The total number of Healpix points at nside=1 equals 12. As hp1 has five
## I values at 3 Healpix points, then the occupied area is
## pi = 1/4*(surface area of unit sphere)

geoArea(hp1)
plot(hp1, size = 5, hp.boundaries = 1)




