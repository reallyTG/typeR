library(subselect)


### Name: rv.coef
### Title: Computes the RV-coefficient applied to the variable subset
###   selection problem
### Aliases: rv.coef
### Keywords: manip

### ** Examples


# A simple example with a trivially small data set

data(iris3) 
x<-iris3[,,1]
rv.coef(var(x),c(1,3))
## [1] 0.8659685


## An example computing the RVs of three subsets produced when the
## anneal function attempted to optimize the RM criterion (using an
## absurdly small number of iterations).

data(swiss)
rmresults<-anneal(cor(swiss),2,nsol=4,niter=5,criterion="Rm")
rv.coef(cor(swiss),rmresults$subsets)

##              Card.2
##Solution 1 0.8389669
##Solution 2 0.8663006
##Solution 3 0.8093862
##Solution 4 0.7529066



