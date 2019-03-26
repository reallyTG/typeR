library(distr)


### Name: distr-package
### Title: distr - Object Oriented Implementation of Distributions
### Aliases: distr-package distr
### Keywords: package distribution

### ** Examples

X <- Unif(2,3)
Y <- Pois(lambda = 3)
Z <- X+Y  # generates Law of corresponding independent variables
p(Z)(0.2)
r(Z)(1000)
plot(Z+sin(Norm()))


