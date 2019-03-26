library(landsat8)


### Name: reflconv
### Title: Conversion to TOA Reflectance
### Aliases: reflconv

### ** Examples

data(band5)
band5.dn<- as(band5, 'SpatialGridDataFrame')
band5.refl<-reflconv(band5.dn,2.0000E-05,-0.100000)



