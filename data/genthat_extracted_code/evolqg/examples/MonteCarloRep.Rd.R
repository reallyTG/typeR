library(evolqg)


### Name: MonteCarloRep
### Title: Parametric repeatabilities with covariance or correlation
###   matrices
### Aliases: MonteCarloRep
### Keywords: montecarlo parametricsampling repeatability

### ** Examples

cov.matrix <- RandomMatrix(5, 1, 1, 10)

MonteCarloRep(cov.matrix, sample.size = 30, RandomSkewers, iterations = 20)
MonteCarloRep(cov.matrix, sample.size = 30, RandomSkewers, num.vectors = 100, 
              iterations = 20, correlation = TRUE)
MonteCarloRep(cov.matrix, sample.size = 30, MatrixCor, correlation = TRUE)
MonteCarloRep(cov.matrix, sample.size = 30, KrzCor, iterations = 20)
MonteCarloRep(cov.matrix, sample.size = 30, KrzCor, correlation = TRUE)

#Creating repeatability vector for a list of matrices
mat.list <- RandomMatrix(5, 3, 1, 10)
laply(mat.list, MonteCarloRep, 30, KrzCor, correlation = TRUE)

##Multiple threads can be used with doMC library
#library(doParallel)
##Windows:
#cl <- makeCluster(2)
#registerDoParallel(cl)
##Mac and Linux:
#registerDoParallel(cores = 2)
#MonteCarloRep(cov.matrix, 30, RandomSkewers, iterations = 100, parallel = TRUE)



