library(LSD)


### Name: heatscatter
### Title: A colored scatterplot based on a two-dimensional Kernel Density
###   Estimation
### Aliases: LSD.heatscatter heatscatter
### Keywords: heatcolors scatterplot,

### ** Examples

points = 10^4
x = c(rnorm(points/2),rnorm(points/2)+4)
y = x + rnorm(points,sd=0.8)
x = sign(x)*abs(x)^1.3

heatscatter(x,y)

heatscatter(x,y,colpal="bl2gr2rd",main="bl2gr2rd",cor=FALSE)

heatscatter(x,y,cor=FALSE,add.contour=TRUE,color.contour="red",greyscale=TRUE)

heatscatter(x,y,colpal="spectral",cor=FALSE,add.contour=TRUE)



