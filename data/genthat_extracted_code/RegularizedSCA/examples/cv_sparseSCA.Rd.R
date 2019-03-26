library(RegularizedSCA)


### Name: cv_sparseSCA
### Title: A K-fold cross-validation procedure when common/distinctive
###   processes are unknown with Lasso and Group Lasso penalties.
### Aliases: cv_sparseSCA

### ** Examples

## Not run: 
##D DATA1 <- matrix(rnorm(50), nrow=5)
##D DATA2 <- matrix(rnorm(100), nrow=5)  
##D DATA <- cbind(DATA1, DATA2)
##D Jk <- c(10, 20) 
##D cv_sparseSCA(DATA, Jk, R=5, MaxIter = 100, NRSTARTS = 40, nfolds=10)
## End(Not run)



