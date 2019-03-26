library(DendSer)


### Name: plotAsColor
### Title: Function that plots a matrix as a color image
### Aliases: plotAsColor

### ** Examples

	 			
require(DendSer) 			

d<- dist(scale(iris[,-5]))
plotAsColor(d,dser(d,hmethod="average"))




