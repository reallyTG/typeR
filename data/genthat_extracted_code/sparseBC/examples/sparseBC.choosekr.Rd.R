library(sparseBC)


### Name: sparseBC.choosekr
### Title: Do tuning parameter K and R selection for sparse biclustering
###   via cross-validation.
### Aliases: sparseBC.choosekr

### ** Examples


########### Create data matrix with K=2 R=4 row and column clusters 
#k <- 2
#r <- 4
#n <- 200
#p <- 200
#  mus<-runif(k*r,-3,3)
#  mus<-matrix(c(mus),nrow=k,ncol=r,byrow=FALSE)
#  truthCs<-sample(1:k,n,rep=TRUE)
#  truthDs<-sample(1:r,p,rep=TRUE)
#  x<-matrix(rnorm(n*p,mean=0,sd=2),nrow=n,ncol=p)
#  for(i in 1:max(truthCs)){
#     for(j in 1:max(truthDs)){ 
#         x[truthCs==i, truthDs==j] <- x[truthCs==i, truthDs==j] + mus[i,j]
#    }
#  }
#  x<-x-mean(x)

# Example is commented out for short run-time	
############ Perform sparseBC.choosekr to choose the number of row and column clusters
#sparseBC.choosekr(x,1:5,1:5,0,0.2)$estimated_kr




