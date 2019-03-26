library(spectralGP)


### Name: lonlat2xy
### Title: Projects lon/lat coordinates to x/y Euclidean coordinate system
### Aliases: lonlat2xy
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(c(128,128),matern.specdens,c(1,4))
n=100
locs=cbind(runif(n,20,80),runif(n,40,50))
locs.predict=cbind(runif(n,30,90),runif(n,38,48))
locs=lonlat2xy(locs)
locs.predict=lonlat2xy(locs.predict)
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



