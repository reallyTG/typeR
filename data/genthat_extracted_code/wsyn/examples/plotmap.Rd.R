library(wsyn)


### Name: plotmap
### Title: Map clusters from a 'clust' object
### Aliases: plotmap

### ** Examples

Tmax<-500
tim<-1:Tmax
ts1<-sin(2*pi*tim/5)
ts1s<-sin(2*pi*tim/5+pi/2)
ts2<-sin(2*pi*tim/12)
ts2s<-sin(2*pi*tim/12+pi/2)
gp1A<-1:2
gp1B<-3:4
gp2A<-5:6
gp2B<-7:8
d<-matrix(NA,Tmax,8)
d[,c(gp1A,gp1B)]<-ts1
d[,c(gp2A,gp2B)]<-ts1s
d[,c(gp1A,gp2A)]<-d[,c(gp1A,gp2A)]+matrix(ts2,Tmax,4)
d[,c(gp1B,gp2B)]<-d[,c(gp1B,gp2B)]+matrix(ts2s,Tmax,4)
d<-d+matrix(rnorm(Tmax*8,0,2),Tmax,8)
d<-t(d)
d<-cleandat(d,1:Tmax,1)$cdat
coords<-data.frame(X=c(rep(1,4),rep(2,4)),Y=rep(c(1:2,4:5),times=2))
cl5<-clust(dat=d,times=1:Tmax,coords=coords,method="ReXWT",tsrange=c(4,6))
plotmap(cl5)
cl12<-clust(dat=d,times=1:Tmax,coords=coords,method="ReXWT",tsrange=c(11,13))
plotmap(cl12)




