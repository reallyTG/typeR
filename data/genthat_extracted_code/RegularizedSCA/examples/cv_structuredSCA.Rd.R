library(RegularizedSCA)


### Name: cv_structuredSCA
### Title: A K-fold cross-validation procedure when common/distinctive
###   processes are known, with a Lasso penalty.
### Aliases: cv_structuredSCA

### ** Examples

## Not run: 
##D DATA1 <- matrix(rnorm(50), nrow=5)
##D DATA2 <- matrix(rnorm(100), nrow=5)
##D DATA <- cbind(DATA1, DATA2)
##D Jk <- c(10, 20) #DATA1 has 10 columns, DATA2 20.
##D R <- 4 
##D Target <- matrix(c(1,1,1,0,1,0,0,1), 2, 4) 
##D cv_structuredSCA(DATA, Jk, R, Target, MaxIter = 100, NRSTARTS = 40, 
##D                 LassoSequence = seq(from= 0.002, to=0.1, 
##D                 length.out = 10))
## End(Not run)



