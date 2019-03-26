library(subselect)


### Name: xi2.coef
### Title: Computes the Xi squared coefficient for a multivariate linear
###   hypothesis
### Aliases: xi2.coef
### Keywords: manip

### ** Examples


## ---------------------------------------------------------------

## 1) A Linear Discriminant Analysis example with a very small data set. 
## We considered the Iris data and three groups, 
## defined by species (setosa, versicolor and virginica).

data(iris)
irisHmat <- ldaHmat(iris[1:4],iris$Species)
xi2.coef(irisHmat$mat,H=irisHmat$H,r=2,c(1,3))
## [1] 0.4942503

## ---------------------------------------------------------------

## 2) An example computing the value of the xi_2 criterion for two subsets 
## produced when the anneal function attempted to optimize the tau_2 
## criterion (using an absurdly small number of iterations).

tauresults<-anneal(irisHmat$mat,2,nsol=2,niter=2,criterion="tau2",
H=irisHmat$H,r=2)
xi2.coef(irisHmat$mat,H=irisHmat$H,r=2,tauresults$subsets)

##              Card.2
##Solution 1 0.5718811
##Solution 2 0.5232262

## ---------------------------------------------------------------




