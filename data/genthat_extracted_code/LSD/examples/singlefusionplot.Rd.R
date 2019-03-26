library(LSD)


### Name: singlefusionplot
### Title: Visualize two-dimensional data clusters (add to an existing
###   plot)
### Aliases: LSD.singlefusionplot singlefusionplot
### Keywords: cluster

### ** Examples

x = 1:1000/300
y = rnorm(1000)+sin(2*x)*3

emptyplot(xlim = range(x),ylim = range(y))
singlefusionplot(x,y,colpal = "ylgnbu")
axis(1)
axis(2)
box()



