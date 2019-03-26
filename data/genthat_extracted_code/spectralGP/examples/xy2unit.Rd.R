library(spectralGP)


### Name: xy2unit
### Title: Scales locations to the unit hypercube for use in spectral GP
### Aliases: xy2unit
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(c(128,128),matern.specdens,c(1,4))
n=100
locs=cbind(runif(n,0.2,1.2),runif(n,-0.2,1.4))
locs.predict=cbind(runif(n,-0.4,0.8),runif(n,-0.1,1.7))
scaled.locs=xy2unit(locs,rbind(locs,locs.predict))
scaled.locs.predict=xy2unit(locs.predict,rbind(locs,locs.predict))
train.map=new.mapping(gp1,scaled.locs)
predict.map=new.mapping(gp1,scaled.locs.predict)
plot(locs,xlim=c(min(locs[,1],locs.predict[,1]),max(locs[,1],
  locs.predict[,1])),ylim=c(min(locs[,2],locs.predict[,2]),
  max(locs[,2],locs.predict[,2])))
points(locs.predict,col=2)
plot(scaled.locs,xlim=c(0,1),ylim=c(0,1))
points(scaled.locs.predict,col=2)



