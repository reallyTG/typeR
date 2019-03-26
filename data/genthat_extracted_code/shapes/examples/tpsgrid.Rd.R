library(shapes)


### Name: tpsgrid
### Title: Thin-plate spline transformation grids
### Aliases: tpsgrid
### Keywords: multivariate hplot

### ** Examples

data(gorf.dat)
data(gorm.dat)

#TPS grid with shape change exaggerated (2x)
gorf<-procGPA(gorf.dat)
gorm<-procGPA(gorm.dat)
TT<-gorf$mshape
YY<-gorm$mshape
tpsgrid(TT,YY,mag=2) 
title("TPS grid: Female mean (left) to Male mean (right)")   




