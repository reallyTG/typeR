library(mosaic)


### Name: fitSpline
### Title: Fit splines to data
### Aliases: fitSpline

### ** Examples

f <- fitSpline( weight ~ height, data=women, df=5 )
xyplot( weight ~ height, data=women )
plotFun(f(height) ~ height, add=TRUE)

g <- fitSpline( length ~ width, data = KidsFeet, type='natural', df=5 )
h <- fitSpline( length ~ width, data = KidsFeet, type='linear', df=5 )
xyplot( length ~ width, data = KidsFeet, col='gray70', pch=16)
plotFun(g, add=TRUE, col='navy')
plotFun(h, add=TRUE, col='red')



