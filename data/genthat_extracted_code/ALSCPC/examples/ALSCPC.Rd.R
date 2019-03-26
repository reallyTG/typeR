library(ALSCPC)


### Name: ALS.CPC
### Title: minimize the objective function Phi(D) by using of the
###   accelerated line search algorithm
### Aliases: ALS.CPC

### ** Examples

nval<-numeric(3) 
nval[[1]]<-49
nval[[2]]<-49
nval[[3]]<-49
S<-vector("list",length=3)
setosa<-iris[1:50,1:4]; names(setosa)<-NULL
versicolor<-iris[51:100,1:4]; names(versicolor)<-NULL
virginica<-iris[101:150,1:4]; names(virginica)<-NULL
S[[1]]<-as.matrix(var(versicolor))
S[[2]]<-as.matrix(var(virginica))
S[[3]]<-as.matrix(var(setosa))
D<-diag(4)
ALS.CPC(10,0.5,0.4,1e-5,G=3,nval,D,S)



