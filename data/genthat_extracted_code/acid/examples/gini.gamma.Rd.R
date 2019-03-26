library(acid)


### Name: gini.gamma
### Title: Gini Coefficient for the Gamma Distribution
### Aliases: gini.gamma

### ** Examples

shape.test <- 5
scale.test  <- 50000
y <- rgamma(10000,shape=shape.test,scale=scale.test)
gini(y)
gini.gamma(shape.test)




