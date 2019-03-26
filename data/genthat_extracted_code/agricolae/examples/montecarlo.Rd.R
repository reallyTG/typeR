library(agricolae)


### Name: montecarlo
### Title: Random generation by Montecarlo
### Aliases: montecarlo
### Keywords: manip

### ** Examples

library(agricolae)
r<-rnorm(50, 10,2)
montecarlo(r, k=100, kernel="epanechnikov")
# other example
h<-hist(r,plot=FALSE)
montecarlo(h, k=100)
# other example
breaks<-c(0, 150, 200, 250, 300)
counts<-c(10, 20, 40, 30)
par(mfrow=c(1,2),cex=0.8,mar=c(2,3,0,0))
h1<-graph.freq(x=breaks,counts=counts,plot=FALSE)
r<-montecarlo(h, k=1000)
plot(h1,frequency = 3,ylim=c(0,0.008))
text(90,0.006,"Population\n100 obs.")
h2<-graph.freq(r,breaks,frequency = 3,ylim=c(0,0.008))
lines(density(r),col="blue")
text(90,0.006,"Montecarlo\n1000 obs.")




