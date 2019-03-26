library(SpatialVx)


### Name: GeoBoxPlot
### Title: Geographic Box Plot
### Aliases: GeoBoxPlot
### Keywords: hplot

### ** Examples

##
## Reproduce the boxplots of Fig. 1 in Willmott et al. (2007).
##
x <- c(4,9,1,3,10,6,7)
a <- c(rep(1,4),2,1,3)
boxplot( x, at=1, xlim=c(0,3))
GeoBoxPlot(x, a, at=2, add=TRUE)
axis( 1, at=c(1,2), labels=c("Traditional", "Geographic"))



