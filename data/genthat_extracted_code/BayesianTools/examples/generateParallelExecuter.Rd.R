library(BayesianTools)


### Name: generateParallelExecuter
### Title: Factory to generate a parallel executer of an existing function
### Aliases: generateParallelExecuter

### ** Examples


testDensityMultiNormal <- generateTestDensityMultiNormal()


parDen <- generateParallelExecuter(testDensityMultiNormal)$parallelFun
x = matrix(runif(9,0,1), nrow = 3)
parDen(x)




