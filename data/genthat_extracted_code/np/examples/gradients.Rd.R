library(np)


### Name: gradients
### Title: Extract Gradients
### Aliases: gradients gradients.condensity gradients.condistribution
###   gradients.npregression gradients.qregression gradients.singleindex
### Keywords: nonparametric

### ** Examples

x <- runif(10)
y <- x + rnorm(10, sd = 0.1)
gradients(npreg(y~x, gradients=TRUE))



