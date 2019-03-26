library(RandVar)


### Name: EuclRandMatrix-class
### Title: Euclidean random matrix
### Aliases: EuclRandMatrix-class
###   coerce,EuclRandMatrix,EuclRandVarList-method Dim
###   Dim,EuclRandMatrix-method Dim<- Dim<-,EuclRandMatrix-method
###   [,EuclRandMatrix-method ncol,EuclRandMatrix-method
###   nrow,EuclRandMatrix-method dimension,EuclRandMatrix-method
###   evalRandVar,EuclRandMatrix,numeric,missing-method
###   evalRandVar,EuclRandMatrix,matrix,missing-method
###   evalRandVar,EuclRandMatrix,numeric,Distribution-method
###   evalRandVar,EuclRandMatrix,matrix,Distribution-method
###   t,EuclRandMatrix-method show,EuclRandMatrix-method
###   %*%,matrix,EuclRandMatrix-method %*%,numeric,EuclRandMatrix-method
###   %*%,EuclRandMatrix,matrix-method %*%,EuclRandMatrix,numeric-method
###   %*%,EuclRandMatrix,EuclRandMatrix-method
###   Arith,numeric,EuclRandMatrix-method
###   Arith,EuclRandMatrix,numeric-method
###   Arith,EuclRandMatrix,EuclRandMatrix-method Math,EuclRandMatrix-method
###   E,UnivariateDistribution,EuclRandMatrix,missing-method
###   E,AbscontDistribution,EuclRandMatrix,missing-method
###   E,DiscreteDistribution,EuclRandMatrix,missing-method
###   E,MultivariateDistribution,EuclRandMatrix,missing-method
###   E,DiscreteMVDistribution,EuclRandMatrix,missing-method
###   E,UnivariateCondDistribution,EuclRandMatrix,numeric-method
###   E,AbscontCondDistribution,EuclRandMatrix,numeric-method
###   E,DiscreteCondDistribution,EuclRandMatrix,numeric-method
### Keywords: classes arith math

### ** Examples

L1 <- list(function(x){x}, function(x){x^2}, function(x){x^3}, function(x){x^4}, 
           function(x){x^5}, function(x){x^6})
L2 <- list(function(x){exp(x)}, function(x){abs(x)}, 
           function(x){sin(x)}, function(x){floor(x)})

R1 <- new("EuclRandMatrix", Map = L1, Dim = as.integer(c(3,2)), 
                            Domain = Reals(), Range = Reals())
dimension(R1)
R1[1:2, 2]
R1[1:2, 1:2]
Map(R1[1,2])
Map(t(R1)[2,1])

R2 <- EuclRandMatrix(Map = L2, ncol = 2, Domain = Reals(), dimension = 1)
dimension(R2)
(DL <- imageDistr(R2, Norm()))
plot(DL)

Map(gamma(R2)) # "Math" group

## "Arith" group
Map(2/R1)
Map(R2 * R2)



