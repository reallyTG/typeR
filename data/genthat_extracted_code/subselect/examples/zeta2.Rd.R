library(subselect)


### Name: zeta2.coef
### Title: Computes the Zeta squared coefficient for a multivariate linear
###   hypothesis
### Aliases: zeta2.coef
### Keywords: manip

### ** Examples


## ---------------------------------------------------------------

## 1) A Linear Discriminant Analysis example with a very small data set. 
## We considered the Iris data and three groups, 
## defined by species (setosa, versicolor and virginica).

data(iris)
irisHmat <- ldaHmat(iris[1:4],iris$Species)
zeta2.coef(irisHmat$mat,H=irisHmat$H,r=2,c(1,3))
## [1] 0.9211501


## ---------------------------------------------------------------

## 2) An example computing the value of the zeta_2 criterion for two  
## subsets produced when the anneal function attempted to optimize  
## the ccr1_2 criterion (using an absurdly small number of iterations).

ccr1results<-anneal(irisHmat$mat,2,nsol=2,niter=2,criterion="ccr12",
H=irisHmat$H,r=2)
zeta2.coef(irisHmat$mat,H=irisHmat$H,r=2,ccr1results$subsets)

##              Card.2
##Solution 1 0.9105021
##Solution 2 0.9161813

## ---------------------------------------------------------------




