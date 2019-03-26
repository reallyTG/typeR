library(FGalgorithm)


### Name: FGalgorithm
### Title: Flury and Gautschi algorithms
### Aliases: FGalgorithm
### Keywords: Flury and Gautschi algorithm

### ** Examples

  
  n<-numeric(3) 
  n[[1]]<-50
  n[[2]]<-50
  n[[3]]<-50
  A<-vector("list",length=3)
  A[[1]]<-var(iris[51:100,1:4])
  A[[2]]<-var(iris[101:150,1:4])
  A[[3]]<-var(iris[1:50,1:4])
  B0<-FGalgorithm(1e-5,1e-5,4,n,A)
  B0



