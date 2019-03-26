library(RegularizedSCA)


### Name: sparseSCA
### Title: Variable selection with Lasso and Group Lasso with a multi-start
###   procedure.
### Aliases: sparseSCA

### ** Examples

## Not run: 
##D DATA1 <- matrix(rnorm(50), nrow=5)
##D DATA2 <- matrix(rnorm(100), nrow=5) 
##D DATA <- cbind(DATA1, DATA2)
##D Jk <- c(10, 20) 
##D R <- 5 
##D LASSO <- 0.2 
##D GROUPLASSO <- 0.4 
##D MaxIter <- 400
##D results <- sparseSCA(DATA, Jk, R, LASSO, GROUPLASSO, 
##D                     MaxIter, NRSTARTS = 10, method = "datablock")
##D 
##D results$Pmatrix 
## End(Not run)



