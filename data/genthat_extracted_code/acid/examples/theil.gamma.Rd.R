library(acid)


### Name: theil.gamma
### Title: Theil Index for the Gamma Distribution
### Aliases: theil.gamma

### ** Examples

shape.test <- 5
scale.test  <- 50000
y <- rgamma(10000,shape=shape.test,scale=scale.test)
entropy(y,1)
theil.gamma(shape.test)




