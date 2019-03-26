library(GenomicMating)


### Name: getOptParentalProportions
### Title: getOptParentalProportions
### Aliases: getOptParentalProportions plotOPFrontier

### ** Examples

library(GenomicMating)
set.seed(12345)
N=20
nmarkers=100
Markers<-c()
for (i in 1:N){
  Markers<-rbind(Markers,rbinom(nmarkers, 2,.1)-1)
}


markereffects<-rep(0,nmarkers)
markereffects[sample(1:nmarkers,nmarkers/2)]<-rnorm(nmarkers/2)
Markers[1:5,1:5]
#library(parallel)
K=Amat.pieces(rbind(Markers), pieces=5) 

rownames(Markers)<-paste("l", 1:nrow(Markers),sep="_")

rownames(K)<-colnames(K)<-c(rownames(Markers))

which.max(Markers%*%markereffects)

colnames(Markers)<-1:nmarkers



oprop<-getOptParentalProportions(Amat=K,
gebvs=Markers%*%markereffects, lambda=.8, ul=1)

pout<-plotOPFrontier(Amat=K,
gebvs=Markers%*%markereffects, ul=1, identify=FALSE)
round(oprop,3)

uhat<-Markers%*%markereffects

gsselected<-which(uhat>quantile(uhat,.9))
gsgain<-mean(uhat[gsselected])

onesvec<-matrix(1,nrow=length(uhat),ncol=1)

onesvec[-gsselected]<-0
onesvec<-onesvec/sum(onesvec)
gsinbreed<-t(onesvec)%*%K%*%onesvec
gsgain
gsinbreed
round(oprop,3)
t(oprop[1:(length(oprop)-4)])%*%K%*%oprop[1:(length(oprop)-4)]
points(gsgain,gsinbreed, pch="*")
text(x=gsgain-.05,y=gsinbreed-.05, "GSSOL", cex=.5)




