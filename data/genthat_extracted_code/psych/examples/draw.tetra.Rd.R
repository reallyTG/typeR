library(psych)


### Name: draw.tetra
### Title: Draw a correlation ellipse and two normal curves to demonstrate
###   tetrachoric correlation
### Aliases: draw.tetra draw.cor
### Keywords: multivariate hplot

### ** Examples

#if(require(mvtnorm)) {
#draw.tetra(.5,1,1)
#draw.tetra(.8,2,1)} else {print("draw.tetra requires the mvtnorm package")
#draw.cor(.5,cuts=c(0,0))}

draw.tetra(.5,1,1)
draw.tetra(.8,2,1)
draw.cor(.5,cuts=c(0,0))



