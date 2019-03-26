library(MTS)


### Name: VARorder
### Title: VAR Order Specification
### Aliases: VARorder

### ** Examples

data("mts-examples",package="MTS")
zt=diffM(log(qgdp[,3:5]))
VARorder(zt,maxp=8)



