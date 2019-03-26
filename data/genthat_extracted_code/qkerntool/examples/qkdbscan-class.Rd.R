library(qkerntool)


### Name: qkdbscan-class
### Title: Class "qkdbscan"
### Aliases: qkdbscan-class clust eps plot MinPts isseed clust<- eps<-
###   MinPts<- isseed<- clust,qkdbscan-method eps,qkdbscan-method
###   plot,qkdbscan-method MinPts,qkdbscan-method isseed,qkdbscan-method
###   clust<-,qkdbscan-method eps<-,qkdbscan-method
###   MinPts<-,qkdbscan-method isseed<-,qkdbscan-method
### Keywords: classes

### ** Examples


# a simple example using the iris data
x<- as.matrix(iris[,-5])
ds <- qkdbscan (x,kernel="laplbase",qpar=list(sigma=3.5,q=0.8),eps=0.15,
MinPts=5,hybrid = FALSE)
# print the results
clust(ds)
eps(ds)
MinPts(ds)
cndkernf(ds)
xmatrix(ds)
kcall(ds)




