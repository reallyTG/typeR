library(rminer)


### Name: mgraph
### Title: Mining graph function
### Aliases: mgraph
### Keywords: aplot classif regression neural nonlinear

### ** Examples

### regression
y=c(1,5,10,11,7,3,2,1);x=rnorm(length(y),0,1.0)+y
mgraph(y,x,graph="RSC",Grid=10,col=c("blue"))
mgraph(y,x,graph="REG",Grid=10,lty=1,col=c("black","blue"),
       leg=list(pos="topleft",leg=c("target","predictions")))
mgraph(y,x,graph="REP",Grid=10)
mgraph(y,x,graph="REP",Grid=10,sort=FALSE)
x2=rnorm(length(y),0,1.2)+y;x3=rnorm(length(y),0,1.4)+y;
L=vector("list",3); pred=vector("list",1); test=vector("list",1);
pred[[1]]=y; test[[1]]=x; L[[1]]=list(pred=pred,test=test,runs=1)
test[[1]]=x2; L[[2]]=list(pred=pred,test=test,runs=1)
test[[1]]=x3; L[[3]]=list(pred=pred,test=test,runs=1)
# distance line comparison graph:
mgraph(L,graph="DLC",metric="MAE",leg=c("x1","x2","x3"),main="MAE errors")

# new REC multi-curve single graph with NAREC (normalized Area of REC) values
# for maximum tolerance of val=0.5 (other val values can be used)
e1=mmetric(y,x,metric="NAREC",val=5)
e2=mmetric(y,x2,metric="NAREC",val=5)
e3=mmetric(y,x3,metric="NAREC",val=5)
l1=paste("x1, NAREC=",round(e1,digits=2))
l2=paste("x2, NAREC=",round(e2,digits=2))
l3=paste("x3, NAREC=",round(e3,digits=2))
mgraph(L,graph="REC",leg=list(pos="bottom",leg=c(l1,l2,l3)),main="REC curves")

### regression example with mining
## Not run: 
##D data(sin1reg)
##D M1=mining(y~.,sin1reg[,c(1,2,4)],model="mr",Runs=5)
##D M2=mining(y~.,sin1reg[,c(1,2,4)],model="mlpe",nr=3,maxit=50,size=4,Runs=5,feature="simp")
##D L=vector("list",2); L[[1]]=M2; L[[2]]=M1
##D mgraph(L,graph="REC",xval=0.1,leg=c("mlpe","mr"),main="REC curve")
##D mgraph(L,graph="DLC",metric="TOLERANCE",xval=0.01,
##D        leg=c("mlpe","mr"),main="DLC: TOLERANCE plot")
##D mgraph(M2,graph="IMP",xval=0.01,leg=c("x1","x2"),
##D        main="sin1reg Input importance",axis=1)
##D mgraph(M2,graph="VEC",xval=1,main="sin1reg 1-D VEC curve for x1")
##D mgraph(M2,graph="VEC",xval=1,
##D        main="sin1reg 1-D VEC curve and histogram for x1",data=sin1reg)
## End(Not run)

### classification example
## Not run: 
##D data(iris)
##D M1=mining(Species~.,iris,model="rpart",Runs=5) # decision tree (DT)
##D M2=mining(Species~.,iris,model="ksvm",Runs=5) # support vector machine (SVM)
##D L=vector("list",2); L[[1]]=M2; L[[2]]=M1
##D mgraph(M1,graph="ROC",TC=3,leg=-1,baseline=TRUE,Grid=10,main="ROC")
##D mgraph(M1,graph="ROC",TC=3,leg=-1,baseline=TRUE,Grid=10,main="ROC",intbar=FALSE)
##D mgraph(L,graph="ROC",TC=3,leg=c("SVM","DT"),baseline=TRUE,Grid=10,
##D        main="ROC for virginica")
##D mgraph(L,graph="LIFT",TC=3,leg=list(pos=c(0.4,0.2),leg=c("SVM","DT")),
##D        baseline=TRUE,Grid=10,main="LIFT for virginica")
## End(Not run)




