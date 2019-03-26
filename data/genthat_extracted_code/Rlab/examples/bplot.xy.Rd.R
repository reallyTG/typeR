library(Rlab)


### Name: bplot.xy
### Title: Boxplots for conditional distribution
### Aliases: bplot.xy
### Keywords: hplot

### ** Examples

# bivariate normal corr= .6
set.seed( 123)
x<-rnorm( 1000)
y<- .6*x +  sqrt( 1- .6**2)*rnorm( 1000)
#
#
bplot.xy( x,y, breaks=seq( -3, 3,,15) ,xlim =c(-4,4), ylim =c(-4,4))
points( x,y, pch=".", col=3)



