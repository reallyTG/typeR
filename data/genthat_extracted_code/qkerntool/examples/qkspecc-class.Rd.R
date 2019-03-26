library(qkerntool)


### Name: qkspecc-class
### Title: Class "qkspecc"
### Aliases: qkspecc-class withinss withinss<- clust,qkspecc-method
###   eVec,qkspecc-method eVal,qkspecc-method withinss,qkspecc-method
###   plot,qkspecc-method clust<-,qkspecc-method eVec<-,qkspecc-method
###   eVal<-,qkspecc-method withinss<-,qkspecc-method
### Keywords: classes

### ** Examples

## Cluster the iris data set.
data("iris")
x=as.matrix(iris[,-5])

qspe <- qkspecc(x,kernel = "rbfbase", qpar = list(sigma = 10, q = 0.9),
                Nocent=3, normalize="symmetric", maxk=15, iterations=1200)
clust(qspe)
eVec(qspe)
eVal(qspe)
xmatrix(qspe)
ymatrix(qspe)
cndkernf(qspe)



