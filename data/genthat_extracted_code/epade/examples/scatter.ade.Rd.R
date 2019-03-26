library(epade)


### Name: scatter.ade
### Title: Scatterplot
### Aliases: scatter.ade
### Keywords: scatterplot bubble

### ** Examples

x<-rnorm(1000)
y<-rnorm(1000)
z<-rnorm(1000, 3)
g<-round(runif(1000))
# plot vs ID
scatter.ade(x, vnames=c("blue","red"), alpha=0.25, fitline=2, wall=0, lwd=2, col=4)
# Scatter plot
scatter.ade(x, y*x, g, vnames=c("blue","red"), alpha=0.25, wall=2)
# bubble plot
scatter.ade(x, y, g, z, vnames=c("blue","red"), alpha=0.25, xlim=c(-5, 5), zticks=c(1, 2, 3, 4, 5), wall=3)



