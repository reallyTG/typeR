library(dr)


### Name: dr.directions
### Title: Directions selected by dimension reduction regressiosn
### Aliases: dr.direction dr.directions dr.direction.default
###   dr.direction.ire dr.basis dr.basis.default dr.basis.ire
### Keywords: regression

### ** Examples

data(ais)
#fit dimension reduction using sir
m1 <- dr(LBM~Wt+Ht+RCC+WCC, method="sir", nslices = 8, data=ais)
summary(m1)
dr.basis(m1)
dr.directions(m1)



