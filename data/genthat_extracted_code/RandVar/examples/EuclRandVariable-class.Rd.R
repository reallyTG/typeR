library(RandVar)


### Name: EuclRandVariable-class
### Title: Euclidean random variable
### Aliases: EuclRandVariable-class
###   coerce,EuclRandVariable,EuclRandMatrix-method
###   coerce,EuclRandVariable,EuclRandVarList-method
###   Range<-,EuclRandVariable-method [,EuclRandVariable-method evalRandVar
###   evalRandVar,EuclRandVariable,numeric,missing-method
###   evalRandVar,EuclRandVariable,matrix,missing-method
###   evalRandVar,EuclRandVariable,numeric,Distribution-method
###   evalRandVar,EuclRandVariable,matrix,Distribution-method imageDistr
###   imageDistr,EuclRandVariable,Distribution-method
###   dimension,EuclRandVariable-method t,EuclRandVariable-method
###   %*%,matrix,EuclRandVariable-method
###   %*%,numeric,EuclRandVariable-method
###   %*%,EuclRandVariable,matrix-method
###   %*%,EuclRandVariable,numeric-method
###   %*%,EuclRandVariable,EuclRandVariable-method
###   %*%,EuclRandVariable,EuclRandMatrix-method
###   %*%,EuclRandMatrix,EuclRandVariable-method
###   Arith,numeric,EuclRandVariable-method
###   Arith,EuclRandVariable,numeric-method
###   Arith,EuclRandVariable,EuclRandVariable-method
###   Math,EuclRandVariable-method
###   E,UnivariateDistribution,EuclRandVariable,missing-method
###   E,AbscontDistribution,EuclRandVariable,missing-method
###   E,DiscreteDistribution,EuclRandVariable,missing-method
###   E,MultivariateDistribution,EuclRandVariable,missing-method
###   E,DiscreteMVDistribution,EuclRandVariable,missing-method
###   E,UnivariateCondDistribution,EuclRandVariable,numeric-method
###   E,AbscontCondDistribution,EuclRandVariable,numeric-method
###   E,DiscreteCondDistribution,EuclRandVariable,numeric-method
### Keywords: classes arith math

### ** Examples

L1 <- list(function(x){x}, function(x){x^2}, function(x){x^3}, function(x){x^4})
L2 <- list(function(x){exp(x)}, function(x){abs(x)}, 
           function(x){sin(x)}, function(x){floor(x)})

R1 <- new("EuclRandVariable", Map = L1, Domain = Reals(), Range = Reals())
dimension(R1)
Map(R1)
Range(R1)
R1[2]
Map(R1[3])
Map(R1[c(1,2,4)])
Map(R1[2:4])
set.seed(123)
evalRandVar(R1, rnorm(1))
x <- as.matrix(rnorm(10))
res.R1 <- evalRandVar(R1, x)
res.R1[2,,] # results for Map(R1)[[2]](x)
res.R1[2,1,] # results for Map(R1)[[2]](x[1,])

R2 <- EuclRandVariable(L2, Domain = Reals(), dimension = 1)
dimension(R2)
DL1 <- imageDistr(R2, Norm())
plot(DL1)

Domain(R2) <- EuclideanSpace(dimension = 2)
Range(R2) <- EuclideanSpace(dimension = 2)
dimension(R2)
(X <- matrix(c(x, rnorm(10)), ncol = 2))
res.R2 <- evalRandVar(R2, X)
res.R2[3,,1] # results for Map(R2)[[3]](X[,1])

Map(log(abs(R2))) # "Math" group generic

# "Arith" group generic
Map(3 + R1)
Map(c(1,3,5) * R1)
try(1:5 * R1) # error
Map(1:2 * R2)
Map(R2 - 5)
Map(R1 ^ R1)




