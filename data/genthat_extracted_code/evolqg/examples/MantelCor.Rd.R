library(evolqg)


### Name: MantelCor
### Title: Compare matrices via Mantel Correlation
### Aliases: MantelCor MantelCor.default MantelCor.list
###   MantelCor.mcmc_sample MatrixCor MatrixCor.default MatrixCor.list
###   MatrixCor.mcmc_sample
### Keywords: matrixcomparison matrixcorrelation randomskewers

### ** Examples

c1 <- RandomMatrix(10, 1, 1, 10)
c2 <- RandomMatrix(10, 1, 1, 10)
c3 <- RandomMatrix(10, 1, 1, 10)
MantelCor(cov2cor(c1), cov2cor(c2))

cov.list <- list(c1, c2, c3)
cor.list <- llply(list(c1, c2, c3), cov2cor)

MantelCor(cor.list)

# For repeatabilities we can use MatrixCor, which skips the significance calculation
reps <- unlist(lapply(cov.list, MonteCarloRep, 10, MatrixCor, correlation = TRUE))
MantelCor(cor.list, repeat.vector = reps)

c4 <- RandomMatrix(10)
MantelCor(cor.list, c4)

#Multiple threads can be used with some foreach backend library, like doMC or doParallel
#library(doParallel)
##Windows:
#cl <- makeCluster(2)
#registerDoParallel(cl)
##Mac and Linux:
#registerDoParallel(cores = 2)
#MantelCor(cor.list, parallel = TRUE) 



