## ---- message=FALSE------------------------------------------------------
library(evclass)

## ------------------------------------------------------------------------
data(ionosphere)
xtr<-ionosphere$x[1:176,]
ytr<-ionosphere$y[1:176]
xtst<-ionosphere$x[177:351,]
ytst<-ionosphere$y[177:351]


## ------------------------------------------------------------------------
param0<- EkNNinit(xtr,ytr)
options=list(maxiter=300,eta=0.1,gain_min=1e-5,disp=FALSE)
fit<-EkNNfit(xtr,ytr,param=param0,K=5,options=options)

## ------------------------------------------------------------------------
print(fit$err)
table(fit$ypred,ytr)

## ------------------------------------------------------------------------
val<-EkNNval(xtrain=xtr,ytrain=ytr,xtst=xtst,K=5,ytst=ytst,param=fit$param)
print(val$err)
table(val$ypred,ytst)

## ------------------------------------------------------------------------
err<-rep(0,15)
i<-0
for(K in 1:15){
  fit<-EkNNfit(xtr,ytr,K,options=list(maxiter=100,eta=0.1,gain_min=1e-5,disp=FALSE))
  err[K]<-fit$err
}
plot(1:15,err,type="b",xlab='K',ylab='LOO error rate')

## ------------------------------------------------------------------------
fit<-EkNNfit(xtr,ytr,K=8,options=list(maxiter=100,eta=0.1,gain_min=1e-5,disp=FALSE))
val<-EkNNval(xtrain=xtr,ytrain=ytr,xtst=xtst,K=8,ytst=ytst,param=fit$param)
print(val$err)
table(val$ypred,ytst)

## ------------------------------------------------------------------------
data(glass)
xtr<-glass$x[1:89,]
ytr<-glass$y[1:89]
xtst<-glass$x[90:185,]
ytst<-glass$y[90:185]

## ------------------------------------------------------------------------
param0<-proDSinit(xtr,ytr,nproto=7,nprotoPerClass=FALSE,crisp=FALSE)

## ------------------------------------------------------------------------
options<-list(maxiter=500,eta=0.1,gain_min=1e-5,disp=20)
fit<-proDSfit(x=xtr,y=ytr,param=param0,options=options)

## ------------------------------------------------------------------------
val<-proDSval(xtst,fit$param,ytst)
print(val$err)
table(ytst,val$ypred)

## ---- fig.width=6, fig.height=6------------------------------------------
data("iris")
x<- iris[,3:4]
y<-as.numeric(iris[,5])
c<-max(y)
plot(x[,1],x[,2],pch=y,xlab="Petal Length",ylab="Petal Width")

param0<-proDSinit(x,y,6)
fit<-proDSfit(x,y,param0)

## ------------------------------------------------------------------------
L=cbind(1-diag(c),rep(0.3,c))
print(L)

## ---- fig.width=6, fig.height=6------------------------------------------
xx<-seq(-1,9,0.01)
yy<-seq(-2,4.5,0.01)
nx<-length(xx)
ny<-length(yy)
Dlower<-matrix(0,nrow=nx,ncol=ny)
Dupper<-Dlower
Dpig<-Dlower
for(i in 1:nx){
  X<-matrix(c(rep(xx[i],ny),yy),ny,2)
  val<-proDSval(X,fit$param)
  Dupper[i,]<-decision(val$m,L=L,rule='upper')
  Dlower[i,]<-decision(val$m,L=L,rule='lower')
  Dpig[i,]<-decision(val$m,L=L,rule='pignistic')
}

contour(xx,yy,Dlower,xlab="Petal.Length",ylab="Petal.Width",drawlabels=FALSE)
for(k in 1:c) points(x[y==k,1],x[y==k,2],pch=k)
contour(xx,yy,Dupper,xlab="Petal.Length",ylab="Petal.Width",drawlabels=FALSE,add=TRUE,lty=2)
contour(xx,yy,Dpig,xlab="Petal.Length",ylab="Petal.Width",drawlabels=FALSE,add=TRUE,lty=3)

## ------------------------------------------------------------------------
L<-cbind(1-diag(c),rep(0.2,c),rep(0.22,c))
L<-rbind(L,c(1,1,1,0.2,0))
print(L)

## ---- fig.width=6, fig.height=6------------------------------------------
for(i in 1:nx){
  X<-matrix(c(rep(xx[i],ny),yy),ny,2)
  val<-proDSval(X,fit$param,rep(0,ny))
  Dlower[i,]<-decision(val$m,L=L,rule='lower')
  Dpig[i,]<-decision(val$m,L=L,rule='pignistic')
}

contour(xx,yy,Dpig,xlab="Petal.Length",ylab="Petal.Width",drawlabels=FALSE)
for(k in 1:c) points(x[y==k,1],x[y==k,2],pch=k)

