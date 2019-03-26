library(rNOMADS)


### Name: MagnitudeAzimuth
### Title: Convert zonal-meridional wind speeds to magnitude/azimuth.
### Aliases: MagnitudeAzimuth
### Keywords: manip

### ** Examples


zonal.wind <- c(35.5, -2)
meridional.wind <- c(-5, 15)
winds <- MagnitudeAzimuth(zonal.wind, meridional.wind)
print(winds$magnitude)
print(winds$azimuth)



