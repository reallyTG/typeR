library(evolqg)


### Name: MonteCarloStat
### Title: Parametric population samples with covariance or correlation
###   matrices
### Aliases: MonteCarloStat
### Keywords: montecarlo parametricsampling repeatability

### ** Examples

cov.matrix <- RandomMatrix(5, 1, 1, 10)

MonteCarloStat(cov.matrix, sample.size = 30, iterations = 50,
               ComparisonFunc = function(x, y) PCAsimilarity(x, y)[1],
               StatFunc = cov)

#Calculating R2 confidence intervals
r2.dist <- MonteCarloR2(RandomMatrix(10, 1, 1, 10), 30)
quantile(r2.dist)

#Multiple threads can be used with some foreach backend library, like doMC or doParallel
#library(doParallel)
##Windows:
#cl <- makeCluster(2)
#registerDoParallel(cl)
##Mac and Linux:
#registerDoParallel(cores = 2)
#MonteCarloStat(cov.matrix, sample.size = 30, iterations = 100,
#               ComparisonFunc = function(x, y) KrzCor(x, y)[1],
#               StatFunc = cov,
#               parallel = TRUE)



