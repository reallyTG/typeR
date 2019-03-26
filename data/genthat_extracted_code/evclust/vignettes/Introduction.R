## ---- message=FALSE------------------------------------------------------
library(evclust)

## ------------------------------------------------------------------------
data(fourclass)
x<-fourclass[,1:2]
y<-fourclass[,3]
plot(x[,1],x[,2],pch=y,col=y,xlab=expression(x[1]),ylab=expression(x[2]))

## ------------------------------------------------------------------------
clus<-ecm(x,c=4,type='full',alpha=1,beta=2,delta=sqrt(20),disp=FALSE)

## ------------------------------------------------------------------------
summary(clus)

## ------------------------------------------------------------------------
clus<-ecm(x,c=4,type='pairs',alpha=1,beta=2,delta=sqrt(20),disp=FALSE)
summary(clus)

## ---- fig.width=6, fig.height=6------------------------------------------
plot(clus,x,mfrow=c(2,2),ytrue=y,Approx=2)

## ------------------------------------------------------------------------
data(protein)
z<- cmdscale(protein$D,k=2)
plot(z[,1],z[,2],xlab='axis 1',ylab='axis 2')

## ---- fig.width=6, fig.height=6------------------------------------------
clus <- recm(D=protein$D,c=4,type='pairs',alpha=0.2,beta=1.1,delta2=20,disp=FALSE)
summary(clus)
plot(clus,X=z,mfrow=c(2,2),ytrue=protein$y)

## ------------------------------------------------------------------------
n<-1000
x<-matrix(rt(2*n,df=5),n,2)
y<-c(rep(1,n/4),rep(2,n/4),rep(3,n/4),rep(4,n/4))
x[(y==2)|(y==4),2]<- 5 + x[(y==2)|(y==4),2]
x[(y==3)|(y==4),1]<- 5 + x[(y==3)|(y==4),1]

plot(x[,1],x[,2],pch=y,col=y,xlab=expression(x[1]),ylab=expression(x[2]))

## ----k-EVCLUS, eval=TRUE, include=TRUE-----------------------------------
clus<-kevclus(x=x,c=4,k=50,disp=FALSE)
summary(clus)

## ---- eval=TRUE----------------------------------------------------------
plot(clus,X=x,ytrue=y)

## ---- fig.width=6, fig.height=6------------------------------------------
data(s2)
plot(s2[,1],s2[,2],xlab=expression(x[1]),ylab=expression(x[2]),pch='.')

## ---- fig.width=6, fig.height=6------------------------------------------
y0<-sample(500,size=5000,replace=TRUE)
clus<- EkNNclus(s2,K=200,y0=y0,ntrials=5,q=0.9,disp=FALSE)
## Summary of the partition
summary(clus)
## Plot of the partition
plot(clus,X=s2,Outliers=FALSE)

## ---- fig.width=6, fig.height=6------------------------------------------
data(s2)
clus<-ecm(x=s2,c=15,type='simple',Omega=FALSE,delta=1,disp=FALSE)
plot(x=clus,X=s2,Outliers = TRUE)

## ------------------------------------------------------------------------
P<-createPairs(clus,k=2)
P$pairs

## ---- fig.width=6, fig.height=6------------------------------------------
clus1<-ecm(x=s2,c=15,type='pairs',Omega=FALSE,pairs=P$pairs,g0=clus$g,delta=1,disp=FALSE)
plot(x=clus1,X=s2,Outliers = TRUE,Approx=2)

## ------------------------------------------------------------------------
data(fourclass)
x<-as.matrix(fourclass[,1:2])
y<-as.vector(fourclass[,3])
## We group classes 1-2 and 3-4
y<-2-(y<=2)
plot(x[,1],x[,2],pch=y,col=y)

## ------------------------------------------------------------------------
y1<-((fourclass[,3]==1) | (fourclass[,3]==3))+1
plot(x[,1],x[,2],pch=y1,col=y1)

## ------------------------------------------------------------------------
const<-create_MLCL(y,nbConst=30)

## ---- message=FALSE------------------------------------------------------
clus<-cecm(x,c=2,type='full',ntrials=5,ML=const$ML,CL=const$CL,delta=10,bal=0.5,distance=1,disp=FALSE)
plot(clus,X=x,ytrue=y,Outliers=TRUE,Approx=1)

