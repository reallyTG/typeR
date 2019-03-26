library(galts)


### Name: galts-package
### Title: Genetic algorithms and C-steps based LTS (Least Trimmed Squares)
###   estimation
### Aliases: galts-package galts
### Keywords: package

### ** Examples

# Data generating process
x1 <- rnorm(100)
x2 <- rnorm(100)
e <- rnorm(100)

# Setting betas to 5
y <- 5 + 5 * x1 + 5 * x2 + e

# Contaminate the data on the dimension of X's randomly
# This is the maximum contamination rate that the LTS can cope with.
outlyings <- sample(1:100, 48)
x1[outlyings] <- 10
x2[outlyings] <- 10

# Estimating LTS with ga (Default optimization method)
lts <- ga.lts(y ~ x1 + x2, popsize = 40, iters = 2, lower = -20, upper = 20)
print(lts)


#Estimating LTS with differential evolution
lts <- ga.lts(y ~ x1 + x2, popsize = 40, iters = 2, lower = -20, upper = 20, method = "de")
print(lts)



