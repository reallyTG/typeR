library(subselect)


### Name: tau2.coef
### Title: Computes the Tau squared coefficient for a multivariate linear
###   hypothesis
### Aliases: tau2.coef
### Keywords: manip

### ** Examples


## ---------------------------------------------------------------

## 1) A Linear Discriminant Analysis example with a very small data set. 
## We considered the Iris data and three groups, 
## defined by species (setosa, versicolor and virginica).
 
data(iris)
irisHmat <- ldaHmat(iris[1:4],iris$Species)
tau2.coef(irisHmat$mat,H=irisHmat$H,r=2,c(1,3))
## [1] 0.8003044

## ---------------------------------------------------------------

## 2) An example computing the value of the tau_2 criterion for two  
## subsets produced when the anneal function attempted to optimize  
## the xi_2 criterion (using an absurdly small number of iterations).

xiresults<-anneal(irisHmat$mat,2,nsol=2,niter=2,criterion="xi2",
H=irisHmat$H,r=2)
tau2.coef(irisHmat$mat,H=irisHmat$H,r=2,xiresults$subsets)

##              Card.2
##Solution 1 0.8079476
##Solution 2 0.7907710

## ---------------------------------------------------------------




