library(MXM)


### Name: Backward selection regression
### Title: Variable selection in regression models with backward selection
### Aliases: bs.reg
### Keywords: Backward regression Markov Blanket Variable Selection

### ** Examples

set.seed(123)
dataset <- matrix( runif(1000 * 10, 1, 100), ncol = 10 )
target <- rnorm(1000)
a <- bs.reg(target, dataset, threshold = 0.05, test = "testIndRQ") 
b <- bs.reg(target, dataset, threshold = 0.05, test = "testIndReg") 
b2 <- bs.reg(target, dataset, threshold = 0.05, test = "testIndFisher") 



