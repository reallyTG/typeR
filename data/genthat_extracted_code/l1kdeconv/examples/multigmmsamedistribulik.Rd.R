library(l1kdeconv)


### Name: multigmmsamedistribulik
### Title: The sum of Log-Likelihoods of 1D Multi Same Distribution
###   Gaussian Mixture Model
### Aliases: multigmmsamedistribulik
### Keywords: distribution

### ** Examples

set.seed(0)
x1=c(
 rnorm(100, mean=0)
 , rnorm(100, mean=1)
 )
x=list(x1)
multigmmsamedistribulik(x)(c(0.5, 1, 0.5, 1))



