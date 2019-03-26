library(WMDB)


### Name: WMDB-package
### Title: Discriminant Analysis Methods by Weight Mahalanobis Distance and
###   bayes
### Aliases: WMDB-package WMDB
### Keywords: weighted Mahalanobis distance method,distance discriminant
###   analysis

### ** Examples

##all parameters equal
X=iris[,1:4]
G=gl(3,50)
wmd(X,G,diag(rep(0.25,4)))
##not all parameters equal
X=iris[,1:4]
G=gl(3,50)
wmd(X,G)
##using bias method to distinguish classes
X<-iris[,1:4]
G<-gl(3,50)
dbayes(X,G)



