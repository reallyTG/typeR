library(rcosmo)


### Name: sphericalHarmonics
### Title: Compute spherical harmonic values at given points on the sphere.
### Aliases: sphericalHarmonics

### ** Examples

## Calculate spherical harmonic value at
## the point (0,1,0) with L=5, m=2
point<-data.frame(x=0,y=1,z=0)
sphericalHarmonics(5,2,point)

## Calculate spherical harmonic values at
## the point (1,0,0), (0,1,0), (0,0,1) with L=5, m=2
points<-data.frame(diag(3))
sphericalHarmonics(5,2,points)




