library(NbClust)


### Name: NbClust
### Title: NbClust Package for determining the best number of clusters
### Aliases: NbClust
### Keywords: Validity Indices Number of clusters clustering validation
###   clustering algorithms cluster validity R packages

### ** Examples


## DATA MATRIX IS GIVEN

## A 2-dimensional example

set.seed(1)
x<-rbind(matrix(rnorm(100,sd=0.1),ncol=2),
         matrix(rnorm(100,mean=1,sd=0.2),ncol=2),
         matrix(rnorm(100,mean=5,sd=0.1),ncol=2),
         matrix(rnorm(100,mean=7,sd=0.2),ncol=2))
         
res<-NbClust(x, distance = "euclidean", min.nc=2, max.nc=8, 
            method = "complete", index = "ch")
            
res$All.index
res$Best.nc
res$Best.partition

## A 5-dimensional example

set.seed(1)
x<-rbind(matrix(rnorm(150,sd=0.3),ncol=5),
          matrix(rnorm(150,mean=3,sd=0.2),ncol=5),
          matrix(rnorm(150,mean=1,sd=0.1),ncol=5),
          matrix(rnorm(150,mean=6,sd=0.3),ncol=5),
          matrix(rnorm(150,mean=9,sd=0.3),ncol=5))

res<-NbClust(x, distance = "euclidean", min.nc=2, max.nc=10, 
            method = "ward.D", index = "all")

res$All.index
res$Best.nc
res$All.CriticalValues
res$Best.partition

## A real data example

data<-iris[,-c(5)] 
res<-NbClust(data, diss=NULL, distance = "euclidean", min.nc=2, max.nc=6, 
            method = "ward.D2", index = "kl") 
res$All.index
res$Best.nc
res$Best.partition
            
res<-NbClust(data, diss=NULL, distance = "euclidean", min.nc=2, max.nc=6, 
            method = "kmeans", index = "hubert")
res$All.index


res<-NbClust(data, diss=NULL, distance = "manhattan", min.nc=2, max.nc=6, 
            method = "complete", index = "all") 
res$All.index
res$Best.nc
res$All.CriticalValues
res$Best.partition

## Examples with a dissimilarity matrix

## Data matrix is given

set.seed(1)
x<-rbind(matrix(rnorm(150,sd=0.3),ncol=3),
          matrix(rnorm(150,mean=3,sd=0.2),ncol=3),
          matrix(rnorm(150,mean=5,sd=0.3),ncol=3))
diss_matrix<- dist(x, method = "euclidean", diag=FALSE)
res<-NbClust(x, diss=diss_matrix, distance = NULL, min.nc=2, max.nc=6, 
            method = "ward.D", index = "ch")  
res$All.index
res$Best.nc
res$Best.partition

data<-iris[,-c(5)]
diss_matrix<- dist(data, method = "euclidean", diag=FALSE)
NbClust(data, diss=diss_matrix, distance = NULL, min.nc=2, max.nc=6, 
            method = "ward.D2", index = "all")   
res$All.index
res$Best.nc
res$All.CriticalValues
res$Best.partition      
    
set.seed(1)    
x<-rbind(matrix(rnorm(20,sd=0.1),ncol=2),
         matrix(rnorm(20,mean=1,sd=0.2),ncol=2),
         matrix(rnorm(20,mean=5,sd=0.1),ncol=2),
         matrix(rnorm(20,mean=7,sd=0.2),ncol=2))
diss_matrix<- dist(x, method = "euclidean", diag=FALSE)
res<-NbClust(x, diss=diss_matrix, distance = NULL, min.nc=2, max.nc=6, 
            method = "ward.D2", index = "alllong")
res$All.index
res$Best.nc
res$All.CriticalValues
res$Best.partition

## Data matrix is not available. Only the dissimilarity matrix is given
## In this case, only these indices can be computed : frey, mcclain, cindex, silhouette and dunn

res<-NbClust(diss=diss_matrix, distance = NULL, min.nc=2, max.nc=6, 
            method = "ward.D2", index = "silhouette")
res$All.index
res$Best.nc
res$All.CriticalValues
res$Best.partition

            



