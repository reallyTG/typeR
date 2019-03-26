library(ClustGeo)


### Name: plot.choicealpha
### Title: Plot of the mixing parameter
### Aliases: plot.choicealpha

### ** Examples

data(estuary)
D0 <- dist(estuary$dat)
D1 <- as.dist(estuary$D.geo) # the geographic distances between the cities
range.alpha <- seq(0,1,0.1)
K <- 5
cr <- choicealpha(D0,D1,range.alpha,K,graph=FALSE)
plot(cr,cex=0.8,norm=FALSE,cex.lab=0.8,ylab="pev",
         col=3:4,legend=c("socio-demo","geo"), xlab="mixing parameter")
plot(cr,cex=0.8,norm=TRUE,cex.lab=0.8,ylab="pev",
         col=5:6,pch=5:6,legend=c("socio-demo","geo"), xlab="mixing parameter")



