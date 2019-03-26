library(evolqg)


### Name: BootstrapStat
### Title: Non-Parametric population samples and statistic comparison
### Aliases: BootstrapStat
### Keywords: montecarlo parametricsampling repeatability

### ** Examples

cov.matrix <- RandomMatrix(5, 1, 1, 10)

BootstrapStat(iris[,1:4], iterations = 50,
               ComparisonFunc = function(x, y) PCAsimilarity(x, y)[1],
               StatFunc = cov)

#Calculating R2 confidence intervals
r2.dist <- BootstrapR2(iris[,1:4], 30)
quantile(r2.dist)

#Multiple threads can be used with some foreach backend library, like doMC or doParallel
#library(doParallel)
##Windows:
#cl <- makeCluster(2)
#registerDoParallel(cl)
##Mac and Linux:
#registerDoParallel(cores = 2)
#BootstrapStat(iris[,1:4], iterations = 100,
#               ComparisonFunc = function(x, y) KrzCor(x, y)[1],
#               StatFunc = cov,
#               parallel = TRUE)



