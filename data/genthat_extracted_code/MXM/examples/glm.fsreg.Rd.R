library(MXM)


### Name: Forward selection with generalised linear regression models
### Title: Variable selection in generalised linear regression models with
###   forward selection
### Aliases: glm.fsreg gammafsreg normlog.fsreg
### Keywords: Markov Blanket Variable Selection

### ** Examples

set.seed(123)

#simulate a dataset with continuous data
dataset <- matrix( runif(1000 * 50, 1, 100), ncol = 50 )

#define a simulated class variable 
target <- rpois(1000, 10)

a <- glm.fsreg(target, dataset, threshold = 0.05, tol = 2, ncores = 1 ) 
b <- MMPC(target, dataset, max_k = 3, threshold = 0.05, test = "testIndPois")



