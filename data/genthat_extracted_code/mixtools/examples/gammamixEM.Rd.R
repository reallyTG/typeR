library(mixtools)


### Name: gammamixEM
### Title: EM Algorithm for Mixtures of Gamma Distributions
### Aliases: gammamixEM
### Keywords: file

### ** Examples

##Analyzing a 3-component mixture of gammas.

set.seed(100)
x <- c(rgamma(200, shape = 0.2, scale = 14), rgamma(200, 
     shape = 32, scale = 10), rgamma(200, shape = 5, scale = 6))
out <- gammamixEM(x, lambda = c(1, 1, 1)/3, verb = TRUE)
out[2:4]



