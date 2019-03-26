library(lsplsGlm)


### Name: pls
### Title: Weighted PLS gaussian regression
### Aliases: pls

### ** Examples

#X simulation
meanX<-sample(1:300,50)
sdeX<-sample(50:150,50)
X<-matrix(nrow=60,ncol=50)
for (i in 1:50){
  X[,i]<-rnorm(60,meanX[i],sdeX[i])
}

#Y simulation
Y<-rnorm(60,30,10)

# Learning sample
index<-sample(1:length(Y),round(2*length(Y)/3))
XL<-X[index,]
YL<-Y[index]

#fit the model
fit<-pls(Y=YL,X=XL,ncomp=3)

#Testing sample
newX=X[-index,]

#predictions with the constant of the model
a.coefficients<-rbind(fit$intercept,fit$coefficients)

#predictions
newY=cbind(rep(1,dim(newX)[1]),newX)%*%a.coefficients




