library(RSKC)


### Name: revisedsil
### Title: The revised silhouette
### Aliases: revisedsil

### ** Examples


# little simulation function 
sim <-
function(mu,f){
   D<-matrix(rnorm(60*f),60,f)
   D[1:20,1:50]<-D[1:20,1:50]+mu
   D[21:40,1:50]<-D[21:40,1:50]-mu  
   return(D)
   }


### output trans.mu ###

p<-200;ncl<-3
# simulate a 60 by p data matrix with 3 classes 
d<-sim(2,p)
# run RSKC
re<-RSKC(d,ncl,L1=2,alpha=0.05)
# cluster centers in weighted squared Euclidean distances by function sil
sil.mu<-revisedsil(d,W=re$weights,C=re$labels,out=re$oW,print.plot=FALSE)$trans.mu
# calculation 
trans.d<-sweep(d[,re$weights!=0],2,sqrt(re$weights[re$weights!=0]),FUN="*") 
class<-re$labels;class[re$oW]<-ncl+1
MEANs<-matrix(NA,ncl,ncol(trans.d))
for ( i in 1 : 3) MEANs[i,]<-colMeans(trans.d[class==i,,drop=FALSE])
sil.mu==MEANs
# coincides 

### output WdisC ###

p<-200;ncl<-3;N<-60
# generate 60 by p data matrix with 3 classes 
d<-sim(2,p)
# run RSKC
re<-RSKC(d,ncl,L1=2,alpha=0.05)
si<-revisedsil(d,W=re$weights,C=re$labels,out=re$oW,print.plot=FALSE)
si.mu<-si$trans.mu
si.wdisc<-si$WdisC
trans.d<-sweep(d[,re$weights!=0],2,sqrt(re$weights[re$weights!=0]),FUN="*") 
WdisC<-matrix(NA,N,ncl)
for ( i in 1 : ncl) WdisC[,i]<-rowSums(scale(trans.d,center=si.mu[i,],scale=FALSE)^2)
# WdisC and si.wdisc coincides




