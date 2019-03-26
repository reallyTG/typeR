library(ifultools)


### Name: sparsestQuadrant
### Title: Estimates sparsest quadrant in data set
### Aliases: sparsestQuadrant
### Keywords: hplot

### ** Examples

## find the sparset quadrant in a circle 
tt <- seq(0,2*pi,length=100)
x  <- sin(tt)
y  <- cos(tt)
sparsestQuadrant(x,y)



