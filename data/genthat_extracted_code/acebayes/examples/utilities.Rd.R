library(acebayes)


### Name: utilities
### Title: Approximate expected utility function for generalised linear
###   models and non-linear regression models
### Aliases: utilitynlm utilityglm

### ** Examples

## 1. This example uses utilityglm to generate the pseudo-Bayesian D-optimality
## approximate expected utility function using a Monte Carlo approximation.

low<-c(-3, 4, 5, -6, -2.5)
upp<-c(3, 10, 11, 0, 3.5)
## Lower and upper limits of the uniform prior distributions.

prior<-function(B){
t(t(6*matrix(runif(n=5*B),ncol=5))+low)}
## Create a function which specifies the prior. This function will return a 
## B by 5 matrix where each row gives a value generated from the prior 
## distribution for the model parameters.

ex <- utilityglm(formula = ~x1+x2+x3+x4, family = binomial, prior = prior, method = "MC")

set.seed(1)
## Set seed for reproducibility.

n<-6
## Specify the sample size (number of runs).

start.d<-matrix( 2 * randomLHS(n = n,k = 4) - 1,nrow = n,ncol = 4,
dimnames = list(as.character(1:n),c("x1", "x2", "x3", "x4")))
## Generate an initial design of appropriate dimension. The initial design is a 
## Latin hypercube sample.

ex$utility(d = start.d, B = 10)
## Evaluate resulting approximate utility. Should get:

## [1] -14.01218 -18.53715 -20.78817 -24.02731 -14.89368 -14.25400 -17.38152
## [8] -17.70984 -14.15254 -21.40505

## 2. This example uses utilitynlm to generate the psuedo-Bayesian A-optimality expected utility
## function using a quadrature approximation

low<-c(0.01884, 0.298, 21.8)
upp<-c(0.09884, 8.298, 21.8)
## Lower and upper limits of the uniform prior distributions. Note that the prior
## for the third element is a point mass.

prior2 <- list(support = cbind(rbind(low, upp)))
colnames(prior2$support) <- c("a", "b", "c")
## Specify a uniform prior with ranges given by low and upp

ex2 <- utilitynlm(formula = ~ c * (exp( - a * t) - exp( - b *t)), prior = prior2, 
                            desvars = "t")
                            
n <- 6
start.d <- matrix(24 * randomLHS(n = n, k = 1), nrow = n)
colnames(start.d) <- "t"
ex2$utility(d = start.d) 
## -13.17817    




