library(RandVar)


### Name: EuclRandVarList-class
### Title: List of Euclidean random variables
### Aliases: EuclRandVarList-class numberOfMaps
###   numberOfMaps,EuclRandVarList-method dimension,EuclRandVarList-method
###   evalRandVar,EuclRandVarList,numeric,missing-method
###   evalRandVar,EuclRandVarList,matrix,missing-method
###   evalRandVar,EuclRandVarList,numeric,Distribution-method
###   evalRandVar,EuclRandVarList,matrix,Distribution-method
###   imageDistr,EuclRandVarList,Distribution-method
###   t,EuclRandVarList-method show,EuclRandVarList-method
###   Arith,numeric,EuclRandVarList-method
###   Arith,EuclRandVarList,numeric-method
###   Arith,EuclRandVarList,EuclRandVarList-method
###   Math,EuclRandVarList-method %m%
###   %m%,EuclRandVarList,EuclRandVarList-method
###   %*%,matrix,EuclRandVarList-method %*%,EuclRandVarList,matrix-method
###   E,UnivariateDistribution,EuclRandVarList,missing-method
###   E,AbscontDistribution,EuclRandVarList,missing-method
###   E,DiscreteDistribution,EuclRandVarList,missing-method
###   E,MultivariateDistribution,EuclRandVarList,missing-method
###   E,DiscreteMVDistribution,EuclRandVarList,missing-method
###   E,UnivariateCondDistribution,EuclRandVarList,numeric-method
###   E,AbscontCondDistribution,EuclRandVarList,numeric-method
###   E,DiscreteCondDistribution,EuclRandVarList,numeric-method
### Keywords: classes

### ** Examples

L1 <- list(function(x){x}, function(x){x^2}, function(x){x^3}, function(x){x^4}, 
           function(x){x^5}, function(x){x^6})
L2 <- list(function(x){exp(x)}, function(x){abs(x)}, 
           function(x){sin(x)}, function(x){floor(x)})

R1 <- new("EuclRandVariable", Map = L2, Domain = Reals(), Range = Reals())
R2 <- EuclRandMatrix(Map = L1, ncol = 2, Domain = Reals(), dimension = 1)
R3 <- EuclRandMatrix(Map = L2, ncol = 2, Domain = Reals(), dimension = 1)

(RL1 <- new("EuclRandVarList", list(R1, R2, R3)))
dimension(RL1)
as(R1, "EuclRandVarList")
as(R2, "EuclRandVarList")

Map(exp(RL1)[[1]]) # "Math" group

## "Arith" group
Map((1 + RL1)[[1]])
Map((RL1 * 2)[[2]])
Map((RL1 / RL1)[[3]])



