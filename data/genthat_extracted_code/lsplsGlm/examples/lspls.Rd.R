library(lsplsGlm)


### Name: lspls
### Title: Weighted LS-PLS gaussian regression
### Aliases: lspls

### ** Examples

#X simulation
meanX<-sample(1:300,50)
sdeX<-sample(50:150,50)
X<-matrix(nrow=60,ncol=50)
for (i in 1:50){
  X[,i]<-rnorm(60,meanX[i],sdeX[i])
}

#D simulation
meanD<-sample(1:30,5)
sdeD<-sample(1:15,5)
D<-matrix(nrow=60,ncol=5)
for (i in 1:5){
  D[,i]<-rnorm(60,meanD[i],sdeD[i])
}

#Y simulation
Y<-rnorm(60,30,10)

# Learning sample
index<-sample(1:length(Y),round(2*length(Y)/3))
XL<-X[index,]
DL<-D[index,]
YL<-Y[index]

#fit the model
fit<-lspls(YL,X=XL,D=DL,ncomp=3,W=diag(rep(1,length(YL))))

#Testing sample
newX=X[-index,]
newD<-D[-index,]

#predictions with the constant of the model
a.coefficients<-c(fit$intercept,fit$coefficients)

#predictions
newZ=(newX-cbind(rep(1,dim(newD)[1]),newD)%*%fit$orthCoef)%*%fit$projection
newY=cbind(rep(1,dim(newD)[1]),newD,newZ)%*%a.coefficients




