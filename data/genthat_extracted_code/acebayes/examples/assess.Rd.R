library(acebayes)


### Name: assess
### Title: Compares two designs under the approximate expected utility
### Aliases: assess assess.ace assess.pace

### ** Examples

## This example involves finding a Bayesian D-optimal design for a 
## compartmental model with n = 18 runs. There are three parameters. 
## Two parameters have uniform priors and the third has a prior 
## point mass. 

n <- 18
k <- 1
p <- 3
set.seed(1)
start.d <- randomLHS(n = n, k = k) * 24
colnames(start.d) <- c("t")

a1<-c(0.01884, 0.298)
a2<-c(0.09884, 8.298)

prior <- list(support = cbind(rbind(a1, a2), c(21.8, 21.8)))
colnames(prior[[1]]) <- c("theta1", "theta2", "theta3") 

example <- acenlm(formula = ~ theta3 * (exp( - theta1 * t) - exp( - theta2 * t)), 
start.d = start.d, prior = prior, lower = 0, upper = 24, N1 = 2, N2 = 0)

## Compute efficiency of final design compared to starting design.
assess(d1 = example, d2 = start.d)

## Should get 

# Approximate expected utility of d1 = 15.40583 
# Approximate expected utility of d2 = 11.26968 
# Approximate relative D-efficiency = 396.9804% 




