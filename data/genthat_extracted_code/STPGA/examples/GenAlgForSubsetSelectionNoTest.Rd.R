library(STPGA)


### Name: GenAlgForSubsetSelectionNoTest
### Title: Genetic algorithm for subset selection no given test
### Aliases: GenAlgForSubsetSelectionNoTest

### ** Examples

## Not run: 
##D ###################### Example for three level designs for the 
##D #second order model in two factors with a square design region
##D X<-matrix(0,nrow=3^2,ncol=5)
##D ij=0
##D 
##D for (i in -1:1){
##D   for (j in -1:1){
##D     ij=ij+1
##D     X[ij,]<-c(i,j, i^2,j^2, i*j)
##D     
##D   }
##D }
##D X<-cbind(1,X)
##D D<-as.matrix(dist(X))
##D K<-tcrossprod(X)
##D rownames(K)<-colnames(K)<-rownames(D)<-colnames(D)<-rownames(X)<-paste("x",1:3^2, sep="")
##D X
##D library(STPGA)
##D ListTrain1<-GenAlgForSubsetSelectionNoTest(P=X,ntoselect=4, InitPop=NULL,
##D              npop=100, nelite=5, mutprob=.5, mutintensity = 1,
##D              niterations=200,minitbefstop=20, tabu=F,tabumemsize = 0,plotiters=F,
##D              lambda=1e-9,errorstat="DOPT", mc.cores=1)
##D                                                  
##D                                                  
##D ListTrain2<-GenAlgForSubsetSelectionNoTest(P=solve(K+1e-6*diag(ncol(K))),ntoselect=4, InitPop=NULL,
##D             npop=100, nelite=5, mutprob=.5, mutintensity = 1,
##D             niterations=200,minitbefstop=20, tabu=F,tabumemsize = 0,plotiters=F,
##D             lambda=1,errorstat="CDMEANMM", mc.cores=1)
##D                                                  
##D                                                  
##D   par(mfrow=c(1,2),mar=c(1,1,1,1))
##D   labelling1<-rownames(X)%in%ListTrain1[[1]]+1
##D   plot(X[,2], X[,3], col=labelling1, pch=2*labelling1,cex=2*(labelling1-1),
##D    xlab="", ylab="", main="DOPT", cex.main=.7,xaxt='n',yaxt='n')
##D     for (i in -1:1){
##D   abline(v=i, lty=2)
##D   abline(h=i,lty=2)
##D     }
##D     labelling2<-rownames(X)%in%ListTrain2[[1]]+1
##D   plot(X[,2], X[,3], col=labelling2, pch=2*labelling2,cex=2*(labelling2-1),
##D    xlab="", ylab="", main="CDMEANMM", cex.main=.7,xaxt='n',yaxt='n')
##D     for (i in -1:1){
##D   abline(v=i, lty=2)
##D   abline(h=i,lty=2)
##D     }
##D 
##D ########################Dopt design three level designs for the second order 
##D #model in two factors with a square design region
##D 
##D par(mfrow=c(2,2),mar=c(1,1,1,1))
##D  for (ntoselect in c(5,6,7,8)){
##D  	ListTrain<-GenAlgForSubsetSelectionNoTest(P=X,ntoselect=ntoselect, InitPop=NULL,
##D              npop=10, nelite=3, mutprob=.5, mutintensity = 1,
##D              niterations=200,minitbefstop=200, tabu=F,tabumemsize = 0,plotiters=F,
##D              lambda=1e-9,errorstat="DOPT", mc.cores=1)
##D              
##D   labelling<-rownames(X)%in%ListTrain[[1]]+1
##D   plot(as.numeric(X[,2]), as.numeric(X[,3]), col=labelling, pch=2*labelling,cex=2*(labelling-1),
##D    xlab="", ylab="", main="DOPT", cex.main=.7,xaxt='n',yaxt='n')
##D     for (i in -1:1){
##D   abline(v=i, lty=2)
##D   abline(h=i,lty=2)
##D     }
##D 
##D }
##D 
##D par(mfrow=c(1,1))
##D 
## End(Not run)



