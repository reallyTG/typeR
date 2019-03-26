library(rcosmo)


### Name: geo2sph
### Title: Convert geographic to spherical coordinates
### Aliases: geo2sph

### ** Examples


geo <- data.frame( lat = c(0, pi/3, pi/2), lon = c(0, pi/3, pi))
geo
sph <- geo2sph(geo)
sph




