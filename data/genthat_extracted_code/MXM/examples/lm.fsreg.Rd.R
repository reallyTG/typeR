library(MXM)


### Name: Forward selection with linear regression models
### Title: Variable selection in linear regression models with forward
###   selection
### Aliases: lm.fsreg
### Keywords: Markov Blanket Variable Selection

### ** Examples

set.seed(123)

#simulate a dataset with continuous data
dataset <- matrix( runif(1000 * 30, 1, 100), ncol = 30 )

#define a simulated class variable 
target <- 3 * dataset[, 10] + 2 * dataset[, 20] + rnorm(1000, 0, 5)
a1 <- lm.fsreg(target, dataset, threshold = 0.05, stopping = "BIC", tol = 2) 



