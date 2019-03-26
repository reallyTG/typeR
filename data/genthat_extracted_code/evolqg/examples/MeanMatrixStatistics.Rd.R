library(evolqg)


### Name: MeanMatrixStatistics
### Title: Calculate mean values for various matrix statistics
### Aliases: MeanMatrixStatistics Autonomy ConditionalEvolvability
###   Constraints Evolvability Flexibility Pc1Percent Respondability
### Keywords: Autonomy ConditionalEvolvability Constraints Evolvability
###   Flexibility Pc1Percent Respondability

### ** Examples

cov.matrix <- cov(iris[,1:4])
MeanMatrixStatistics(cov.matrix)

#Multiple threads can be used with some foreach backend library, like doMC or doParallel
#library(doParallel)
##Windows:
#cl <- makeCluster(2)
#registerDoParallel(cl)
##Mac and Linux:
#registerDoParallel(cores = 2)
#MeanMatrixStatistics(cov.matrix, parallel = TRUE)



