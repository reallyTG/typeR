library(acebayes)


### Name: acenlm
### Title: Approximate Coordinate Exchange (ACE) Algorithm for Non-Linear
###   Models
### Aliases: acenlm pacenlm

### ** Examples

## This example uses aceglm to find a Bayesian D-optimal design for a 
## compartmental model with 6 runs 1 factor. The priors are 
## those used by Overstall & Woods (2017). The design space for each 
## coordinate is [0, 24] hours.

set.seed(1)
## Set seed for reproducibility.

n<-6
## Specify the sample size (number of runs).

start.d<-matrix(24 * randomLHS(n = n, k = 1), nrow = n, ncol = 1,
dimnames = list(as.character(1:n), c("t")))
## Generate an initial design of appropriate dimension. The initial design is a 
## Latin hypercube sample.

low<-c(0.01884, 0.298, 21.8)
upp<-c(0.09884, 8.298, 21.8)
## Lower and upper limits of the support of the uniform prior distributions. Note that the prior
## for the third element is a point mass.

prior<-function(B){
out<-cbind(runif(n = B, min = low[1], max = upp[1]), runif(n = B, min = low[2],max = upp[2]),
runif(n = B, min = low[3], max = upp[3]))
colnames(out)<-c("a", "b", "c")
out}

## Create a function which specifies the prior. This function will return a 
## B by 3 matrix where each row gives a value generated from the prior 
## distribution for the model parameters.

example1<-acenlm(formula = ~ c*(exp( - a * t) - exp( - b * t)), start.d = start.d, prior = prior, 
N1 = 1, N2 = 0, B = c(1000, 1000), lower = 0, upper = 24, method = "MC")
## Call the acenlm function which implements the ACE algorithm requesting 
## only one iteration of Phase I and zero iterations of Phase II. The Monte
## Carlo sample size for the comparison procedure (B[1]) is set to 1000.

example1
## Print out a short summary.

#Non Linear Model 
#Criterion = Bayesian D-optimality 
#Formula: ~c * (exp(-a * t) - exp(-b * t))
#Method:  MC 
#
#B:  1000 1000 
#
#Number of runs = 6
#
#Number of factors = 1
#
#Number of Phase I iterations = 1
#
#Number of Phase II iterations = 0
#
#Computer time = 00:00:00

example1$phase2.d
## Look at the final design.

#           t
#1 19.7787011
#2  2.6431912
#3  0.2356938
#4  8.2471451
#5  1.4742319
#6 12.7062270

prior2 <- list(support = cbind(rbind(low, upp)))
colnames(prior2$support) <- c("a", "b", "c")
example2 <- acenlm(formula = ~ c * (exp( - a * t) - exp( - b *t)), start.d = start.d, 
prior = prior2, lower = 0, upper = 24, N1 = 1, N2 = 0 )
## Call the acenlm function with the default method of "quadrature"

example2$phase2.d
## Final design

#           t
#1  0.5167335
#2  2.3194434
#3  1.5365409
#4  8.2471451
#5 21.9402670
#6 12.7062270

utility <- utilitynlm(formula = ~c * (exp( - a * t) - exp( - b *t)), prior = prior, 
                            desvars = "t", method = "MC" )$utility
## create a utility function to compare designs

mean(utility(example1$phase1.d, B = 20000))
#[1] 12.13773
mean(utility(example2$phase1.d, B = 20000))
#[1] 11.19745
## Compare the two designs using the Monte Carlo approximation



