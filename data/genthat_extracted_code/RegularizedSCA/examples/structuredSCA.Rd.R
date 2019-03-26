library(RegularizedSCA)


### Name: structuredSCA
### Title: Variable selection algorithm with a predefined component loading
###   structure.
### Aliases: structuredSCA

### ** Examples

## Not run: 
##D DATA1 <- matrix(rnorm(50), nrow=5)
##D DATA2 <- matrix(rnorm(100), nrow=5) 
##D DATA <- cbind(DATA1, DATA2)
##D Jk <- c(10, 20) 
##D R <- 5 
##D Target <- matrix(c(1,1,1,0,1,0,0,1,0,1), 2, 5) 
##D LASSO <- 0.2 
##D MaxIter <- 400
##D NRSTARTS <- 5
##D structuredSCA(DATA, Jk, R, Target, LASSO = LASSO)
## End(Not run)



