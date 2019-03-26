library(Benchmarking)


### Name: sdea
### Title: Super efficiency
### Aliases: sdea
### Keywords: models efficiency

### ** Examples

x <- matrix(c(100,200,300,500,100,200,600),ncol=1)
y <- matrix(c(75,100,300,400,25,50,400),ncol=1)
se <- sdea(x,y)
se

# Leave out firm 3 as a determining firm of the technology set
n <- 3
dea.plot.frontier(x[-n], y[-n], txt=(1:dim(x)[1])[-n])
# Plot and label firm 3
points(x[n],y[n],cex=1.25,pch=16)
text(x[n],y[n],n,adj=c(-.75,.75))



