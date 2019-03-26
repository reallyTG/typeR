library(acebayes)


### Name: acebayes-package
### Title: Optimal Bayesian Experimental Design using the Approximate
###   Coordinate Exchange (ACE) Algorithm
### Aliases: acebayes-package acebayes
### Keywords: package

### ** Examples

## This example uses aceglm to find a pseudo-Bayesian D-optimal design for a 
## first-order logistic regression model with 6 runs 4 factors (i.e. 5 parameters).
## The priors are those used by Overstall & Woods (2017), i.e. a uniform prior 
## distribution is assumed for each parameter. The design space for each coordinate 
## is [-1, 1].

set.seed(1)
## Set seed for reproducibility.

n<-6
## Specify the sample size (number of runs).

start.d<-matrix(2 * randomLHS(n = n,k = 4) - 1, nrow = n, ncol = 4,
dimnames = list(as.character(1:n), c("x1", "x2", "x3", "x4")))
## Generate an initial design of appropriate dimension. The initial design is a 
## Latin hypercube sample.

low<-c(-3, 4, 5, -6, -2.5)
upp<-c(3, 10, 11, 0, 3.5)
## Lower and upper limits of the uniform prior distributions.

prior<-function(B){
t(t(6*matrix(runif(n = 5*B), ncol = 5)) + low)}
## Create a function which specifies the prior. This function will return a 
## B by 5 matrix where each row gives a value generated from the prior 
## distribution for the model parameters.

example<-aceglm(formula = ~ x1 + x2 + x3 + x4,  start.d = start.d, family = binomial, 
prior = prior , criterion = "D", method= "MC", B = c(1000,1000), N1 = 1, N2 = 0, 
upper = 1)
## Call the aceglm function which implements the ACE algorithm requesting 
## only one iteration of Phase I and zero iterations of Phase II (chosen for 
## illustrative purposes). The Monte Carlo sample size for the comparison 
## procedure (B[1]) is set to 1000 (chosen again for illustrative purposes).

example
## Print out a short summary. 

#Generalised Linear Model
#Criterion = Bayesian D-optimality 
#
#Number of runs = 6
#
#Number of factors = 4
#
#Number of Phase I iterations = 1
#
#Number of Phase II iterations = 0
#
#Computer time = 00:00:02

## The final design found is:

example$phase2.d

#          x1          x2          x3         x4
#1 -0.3571245  0.16069337 -0.61325375  0.9276443
#2 -0.9167309  0.91411512  0.69842151  0.2605092
#3 -0.8843699  0.42863930 -1.00000000 -0.9679402
#4  0.3696224 -0.27126080  0.65284076  0.1850767
#5  0.7172267 -0.34743402 -0.05968457 -0.6588896
#6  0.7469636  0.05854029  1.00000000 -0.1742566



