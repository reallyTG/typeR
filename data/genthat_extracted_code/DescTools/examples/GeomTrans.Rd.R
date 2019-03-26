library(DescTools)


### Name: GeomTrans
### Title: Geometric Transformations
### Aliases: GeomTrans
### Keywords: aplot

### ** Examples

# let's have a triangle
Canvas(main="Rotation")
x <- DrawRegPolygon(nv=3)[[1]]

xt <- GeomTrans(x, trans=c(1, 3), scale=c(2, 2), theta=pi/4)
polygon(xt)



