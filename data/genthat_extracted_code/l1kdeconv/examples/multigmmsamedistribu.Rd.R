library(l1kdeconv)


### Name: multigmmsamedistribu
### Title: Fit Multi 2-Component Gaussian Mixture Model in same
###   distribution with a Fixed Proportion
### Aliases: multigmmsamedistribu
### Keywords: distribution

### ** Examples

set.seed(0)
x1=c(rnorm(150, mean=0), rnorm(50, mean=10))
x2=c(rnorm(150, mean=20), rnorm(50, mean=40))
x3=c(rnorm(150, mean=30), rnorm(50, mean=60))
x=list(x1, x2, x3)
multigmmsamedistribu(x)



