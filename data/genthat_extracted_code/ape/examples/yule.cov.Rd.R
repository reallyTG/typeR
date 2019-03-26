library(ape)


### Name: yule.cov
### Title: Fits the Yule Model With Covariates
### Aliases: yule.cov
### Keywords: models

### ** Examples

### a simple example with some random data
data(bird.orders)
x <- rnorm(45) # the tree has 23 tips and 22 nodes
### the standard-error for x should be as large as
### the estimated parameter
yule.cov(bird.orders, ~ x)
### another example with a tree that has a multichotomy
data(bird.families)
y <- rnorm(272) # 137 tips + 135 nodes
yule.cov(bird.families, ~ y)



