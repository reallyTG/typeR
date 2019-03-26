library(performanceEstimation)


### Name: runWorkflow
### Title: Run a workflow on a predictive task
### Aliases: runWorkflow
### Keywords: models

### ** Examples

## Not run: 
##D ## A simple example
##D data(iris)
##D w1 <- Workflow("mySolution",par1="gaussian",k=10)
##D runWorkflow(w1,Species ~ .,iris[1:100,],iris[101:150,])
## End(Not run)



