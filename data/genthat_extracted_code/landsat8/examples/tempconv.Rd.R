library(landsat8)


### Name: tempconv
### Title: Conversion to At Satellite Brightness Temperature
### Aliases: tempconv

### ** Examples

data(band11)
band11.dn<- as(band11, 'SpatialGridDataFrame')
band11.tempK<-tempconv(band11.dn,3.3420E-04,0.10000, 480.89, 1201.14)



