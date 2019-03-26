library(subselect)


### Name: gcd.coef
### Title: Computes Yanai's GCD in the context of the variable-subset
###   selection problem
### Aliases: gcd.coef
### Keywords: manip

### ** Examples


## An example with a very small data set.

data(iris3) 
x<-iris3[,,1]
gcd.coef(cor(x),c(1,3))
## [1] 0.7666286
gcd.coef(cor(x),c(1,3),pcindices=c(1,3))
## [1] 0.584452
gcd.coef(cor(x),c(1,3),pcindices=1)
## [1] 0.6035127

## An example computing the GCDs of three subsets produced when the
## anneal function attempted to optimize the RV criterion (using an
## absurdly small number of iterations).

data(swiss)
rvresults<-anneal(cor(swiss),2,nsol=4,niter=5,criterion="Rv")
gcd.coef(cor(swiss),rvresults$subsets)

##              Card.2
##Solution 1 0.4962297
##Solution 2 0.7092591
##Solution 3 0.4748525
##Solution 4 0.4649259



