library(RSKC)


### Name: RSKC
### Title: Robust Sparse K-means
### Aliases: RSKC RSKC.trimkmeans RSKC.trimkmeans.missing

### ** Examples

# little simulation function 
sim <-
function(mu,f){
   D<-matrix(rnorm(60*f),60,f)
   D[1:20,1:50]<-D[1:20,1:50]+mu
   D[21:40,1:50]<-D[21:40,1:50]-mu  
   return(D)
   }

set.seed(1);d0<-sim(1,500)# generate a dataset
true<-rep(1:3,each=20) # vector of true cluster labels
d<-d0
ncl<-3
for ( i in 1 : 10){
   d[sample(1:60,1),sample(1:500,1)]<-rnorm(1,mean=0,sd=15)
}

# The generated dataset looks like this...
pairs(
      d[,c(1,2,3,200)],col=true, 
      labels=c("clustering feature 1",
      "clustering feature 2","clustering feature 3",
      "noise feature1"),
      main="The sampling distribution of 60 cases colored by true cluster labels", 
      lower.panel=NULL) 


# Compare the performance of four algorithms
###3-means
r0<-kmeans(d,ncl,nstart=100)
CER(r0$cluster,true)

###Sparse 3-means
#This example requires sparcl package
#library(sparcl)
#r1<-KMeansSparseCluster(d,ncl,wbounds=6)
# Partition result
#CER(r1$Cs,true)
# The number of nonzero weights
#sum(!r1$ws<1e-3)

###Trimmed 3-means

r2<-RSKC(d,ncl,alpha=10/60,L1=NULL,nstart=200)
CER(r2$labels,true)

###Robust Sparse 3-means
r3<-RSKC(d,ncl,alpha=10/60,L1=6,nstart=200)
# Partition result
CER(r3$labels,true)
r3

### RSKC works with datasets containing missing values...
# add missing values to the dataset
set.seed(1)
for ( i in 1 : 100)
{   
d[sample(1:60,1),sample(1,500,1)]<-NA
}
r4 <- RSKC(d,ncl,alpha=10/60,L1=6,nstart=200)




