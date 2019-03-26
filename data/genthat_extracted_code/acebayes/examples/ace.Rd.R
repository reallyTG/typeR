library(acebayes)


### Name: ace
### Title: Approximate Coordinate Exchange (ACE) Algorithm
### Aliases: ace pace acephase1 acephase2

### ** Examples

set.seed(1)
## Set seed for reproducibility.

## This example involves finding a pseudo-Bayesian D-optimal design for a 
## compartmental model with n = 18 runs. There are three parameters. 
## Two parameters have uniform priors and the third has a prior 
## point mass. For more details see Overstall & Woods (2017).

start.d<-optimumLHS(n = 18, k = 1)
## Create an initial design.

## Using a MC approximation
example1<-ace(utility = utilcomp18bad, start.d = start.d, N1 = 1, N2 = 2, B = c(100, 20))
## Implement the ACE algorithm with 1 Phase I iterations and 2 Phase II
## iterations. The Monte Carlo sample sizes are 100 (for comparison) and 20 for
## fitting the GP emulator.

example1
## Produce a short summary.

#User-defined model & utility 
#
#Number of runs = 18
#
#Number of factors = 1
#
#Number of Phase I iterations = 1
#
#Number of Phase II iterations = 2
#
#Computer time = 00:00:00

mean(utilcomp18bad(d = example1$phase2.d, B = 100))
## Calculate an approximation to the expected utility for the final design.
## Should get:

#[1] 9.254198

## Not run: 
##D plot(example1)
##D ## Produces a trace plot of the current value of the expected utility. This
##D ## can be used to assess convergence.
## End(Not run)




