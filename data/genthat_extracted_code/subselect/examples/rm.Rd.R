library(subselect)


### Name: rm.coef
### Title: Computes the RM coefficient for variable subset selection
### Aliases: rm.coef
### Keywords: manip

### ** Examples


## An example with a very small data set.

data(iris3) 
x<-iris3[,,1]
rm.coef(var(x),c(1,3))
## [1] 0.8724422

## An example computing the RMs of three subsets produced when the
## anneal function attempted to optimize the RV criterion (using an
## absurdly small number of iterations).

data(swiss)
rvresults<-anneal(cor(swiss),2,nsol=4,niter=5,criterion="Rv")
rm.coef(cor(swiss),rvresults$subsets)

##              Card.2
##Solution 1 0.7982296
##Solution 2 0.7945390
##Solution 3 0.7649296
##Solution 4 0.7623326



