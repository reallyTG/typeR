library(mosaic)


### Name: plotPoints
### Title: Scatter plot of points
### Aliases: plotPoints

### ** Examples

if (require(mosaicData)) {
plotPoints( width ~ length, data=KidsFeet, groups=sex, pch=20)
f <- makeFun( lm( width ~ length * sex, data=KidsFeet))
plotFun( f(length=length,sex="G")~length, add=TRUE, col="pink")
plotFun( f(length=length,sex="B")~length, add=TRUE)
}



