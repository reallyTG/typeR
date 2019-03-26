library(gfmR)


### Name: predict.gfmR
### Title: Predict method for group fused multinomial logistic regression
### Aliases: predict.gfmR
### Keywords: regression

### ** Examples


## Not run: 
##D data(nes96)
##D attach(nes96)
##D Response=matrix(0,944,7)
##D for(i in 1:944){
##D   if(PID[i]=="strRep"){Response[i,1]=1}
##D   if(PID[i]=="weakRep"){Response[i,2]=1}
##D   if(PID[i]=="indRep"){Response[i,3]=1}
##D   if(PID[i]=="indind"){Response[i,4]=1}
##D   if(PID[i]=="indDem"){Response[i,5]=1}
##D   if(PID[i]=="weakDem"){Response[i,6]=1}
##D   if(PID[i]=="strDem"){Response[i,7]=1}
##D }
##D 
##D Hmat=matrix(1,dim(Response)[2],dim(Response)[2])
##D diag(Hmat)=0
##D ModMat<-lm(popul~age,x=TRUE)$x
##D 
##D X=cbind(ModMat[,1],apply(ModMat[,-1],2,scale))
##D mod<-GroupFusedMulti(Response,X,lambda=2^4.3,H=Hmat2,rho=10^2,iter=50,tol1=10^-4,tol2=10^-4)
##D predict(mod,X[1,])
## End(Not run)




