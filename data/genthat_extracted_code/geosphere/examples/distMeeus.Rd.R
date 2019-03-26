library(geosphere)


### Name: distMeeus
### Title: 'Meeus' great circle distance
### Aliases: distMeeus
### Keywords: spatial

### ** Examples

distMeeus(c(0,0),c(90,90))
# on a 'Clarke 1880' ellipsoid
distMeeus(c(0,0),c(90,90), a=6378249.145, f=1/293.465)



