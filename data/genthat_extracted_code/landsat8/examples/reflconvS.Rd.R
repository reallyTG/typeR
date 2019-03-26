library(landsat8)


### Name: reflconvS
### Title: Conversion to TOA Reflectance with a Correction for the Sun
###   Angle
### Aliases: reflconvS

### ** Examples

data(band5)
band5.dn<- as(band5, 'SpatialGridDataFrame')
band5.reflS<-reflconvS(band5.dn,2.0000E-05,-0.100000,41.12846745)



