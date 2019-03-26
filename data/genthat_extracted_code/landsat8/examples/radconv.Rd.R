library(landsat8)


### Name: radconv
### Title: Conversion to TOA Radiance
### Aliases: radconv

### ** Examples

data(band5)
band5.dn<- as(band5, 'SpatialGridDataFrame')
band5.rad<-radconv(band5.dn,5.9150E-03,-29.57525)



