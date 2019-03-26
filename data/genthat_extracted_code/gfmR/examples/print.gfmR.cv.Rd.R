library(gfmR)


### Name: print.gfmR.cv
### Title: print method for group fused multinomial logistic regression
###   validation likelihood tuning parameter selection
### Aliases: print.gfmR.cv
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
##D 
##D set.seed(1010)
##D n=dim(Response)[1]
##D sampID=rep(5,n)
##D samps=sample(1:n)
##D mine=floor(n/5)
##D for(j in 1:4){
##D   sampID[samps[((j-1)*mine+1):(j*mine)]]=j
##D }
##D 
##D o1<-GFMR.cv(Response,X,lamb = 2^seq(4.2,4.3,.1),H=Hmat2,sampID = sampID,n.cores =5)
##D o1
## End(Not run)




