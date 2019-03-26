library(MXM)


### Name: BIC based forward selection
### Title: Variable selection in regression models with forward selection
###   using BIC
### Aliases: bic.fsreg
### Keywords: Markov Blanket Variable Selection

### ** Examples

set.seed(123)
dataset <- matrix( runif(1000 * 20, 1, 100), ncol = 20 )
target <- 3 * dataset[, 10] + 2 * dataset[, 15] + 3 * dataset[, 20] + rnorm(1000, 0, 5)

a1 <- bic.fsreg(target, dataset, tol = 4, ncores = 1, test = "testIndReg" ) 
a3 <- MMPC(target, dataset, ncores = 1)
target <- round(target)
b1 <- bic.fsreg(target, dataset, tol = 2, ncores = 1, test = "testIndReg" ) 



