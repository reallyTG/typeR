library(sparseBC)


### Name: sparseBC
### Title: Sparse biclustering
### Aliases: sparseBC

### ** Examples

##############################################
# Example from Figure 1 in the manuscript
# A toy example to illustrate the results from k-means and sparse biclustering
##############################################

# Generate the data matrix x
set.seed(1)
n<-100
p<-200
k<-5
r<-5
truthCs<-rep(1:k, each=(n/k))
truthDs<-rep(1:r, each=(p/r))
mus<-runif(k*r,-3,3)
mus<-matrix(c(mus),nrow=k,ncol=r,byrow=FALSE)
x<-matrix(rnorm(n*p,mean=0,sd=5),nrow=n,ncol=p)

# Generate the mean matrix 
musmatrix<-matrix(NA,nrow=n,ncol=p)
for(i in 1:max(truthCs)){
  for(j in 1:max(truthDs)){ 
  x[truthCs==i,truthDs==j]<-x[truthCs==i,truthDs==j]+mus[i,j]
  musmatrix[truthCs==i,truthDs==j]<-mus[i,j]
  } 
}	

# Perform kmeans on the row and columns and calculate its mean
km.Cs<-kmeans(x,k,nstart=20)$cluster
km.Ds<-kmeans(t(x),r,nstart=20)$cluster
km.mus<-matrix(NA,nrow=n,ncol=p)
for(i in 1:n){
  for(j in 1:p){
  km.mus[i,j]<-mean(x[km.Cs==km.Cs[i],km.Ds==km.Ds[j]])		
  }
}

# Perform sparse biclustering with 5 row clusters and 5 column clusters and lambda=0
bicluster<-sparseBC(x,5,5,0)


# Display some information on the object sparseBC
summary(bicluster)


# Image plots to illustrate the estimated mean matrix
par(mfrow=c(2,2))
image(t(x),main="x")
image(t(musmatrix),main="Mean Matrix")
image(t(km.mus),main="Kmeans")
image(t(bicluster$mus),main="sparseBC")

# Built-in image plot for object sparseBC
image(bicluster)



