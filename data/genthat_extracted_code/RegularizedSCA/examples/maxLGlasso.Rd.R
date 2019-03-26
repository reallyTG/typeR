library(RegularizedSCA)


### Name: maxLGlasso
### Title: An algorithm for determining the smallest values for Lasso and
###   Group Lasso tuning parameters that yield all zeros.
### Aliases: maxLGlasso

### ** Examples

## Not run: 
##D DATA1 <- matrix(rnorm(50), nrow=5)
##D DATA2 <- matrix(rnorm(100), nrow=5)
##D DATA <- cbind(DATA1, DATA2)
##D Jk <- c(10, 20) 
##D results <- maxLGlasso(DATA, Jk, R=5)
##D maxGLasso <- results$Glasso
##D maxLasso <- results$Lasso
## End(Not run)



