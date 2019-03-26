library(SphericalK)


### Name: sphere_khat
### Title: Calculate Spherical K-Function
### Aliases: sphere_khat

### ** Examples

lat<-sphere_random(100)$latitudes; lon<-sphere_random(100)$longitudes
d<-seq(from=0,to=pi,by=0.1)
sphere_khat(lat,lon,d)



