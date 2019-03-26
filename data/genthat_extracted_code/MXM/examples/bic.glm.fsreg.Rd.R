library(MXM)


### Name: BIC based forward selection with generalised linear models
### Title: Variable selection in generalised linear models with forward
###   selection based on BIC
### Aliases: bic.glm.fsreg bic.mm.fsreg bic.gammafsreg bic.normlog.fsreg
### Keywords: Markov Blanket Variable Selection

### ** Examples

set.seed(123)
dataset <- matrix( runif(1000 * 50, 1, 100), ncol = 50 )
target <- 3 * dataset[, 10] + 2 * dataset[, 20] + 3 * dataset[, 30] + rnorm(1000, 0, 5)
a1 <- bic.glm.fsreg(target, dataset, tol = 2, ncores = 1 ) 
a2 <- bic.glm.fsreg( round(target), dataset, tol = 2, ncores = 1 ) 
y <- target   ;   me <- median(target)  ;   y[ y < me ] <- 0   ;   y[ y >= me ] <- 1
a3 <- bic.glm.fsreg( y, dataset, tol = 2, ncores = 1 ) 



