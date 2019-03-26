library(MXM)


### Name: IAMB backward selection phase
### Title: IAMB backward selection phase
### Aliases: iamb.bs
### Keywords: Backward regression Markov Blanket Variable Selection

### ** Examples

set.seed(123)
dataset <- matrix( runif(1000 * 10, 1, 100), ncol = 10 )
target <- rnorm(1000)

a1 <- iamb.bs(target, dataset, threshold = 0.05, test = "testIndRQ") 
a2 <- bs.reg(target, dataset, threshold = 0.05, test = "testIndRQ") 



