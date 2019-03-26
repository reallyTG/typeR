library(subselect)


### Name: ccr12.coef
### Title: First Squared Canonical Correlation for a multivariate linear
###   hypothesis
### Aliases: ccr12.coef
### Keywords: manip

### ** Examples


## 1) A Linear Discriminant Analysis example with a very small data set. 
## We considered the Iris data and three groups, 
## defined by species (setosa, versicolor and virginica).

data(iris)
irisHmat <- ldaHmat(iris[1:4],iris$Species)
ccr12.coef(irisHmat$mat,H=irisHmat$H,r=2,c(1,3))
## [1]  0.9589055

## ---------------------------------------------------------------

## 2) An example computing the value of the ccr1_2 criteria for two  
## subsets produced when the anneal function attempted to optimize
## the zeta_2 criterion (using an absurdly small number of iterations).

zetaresults<-anneal(irisHmat$mat,2,nsol=2,niter=2,criterion="zeta2",
H=irisHmat$H,r=2)
ccr12.coef(irisHmat$mat,H=irisHmat$H,r=2,zetaresults$subsets)

##              Card.2
##Solution 1 0.9526304
##Solution 2 0.9558787

## ---------------------------------------------------------------




