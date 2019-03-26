library(MultivariateRandomForest)


### Name: Node_cost
### Title: Information Gain
### Aliases: Node_cost

### ** Examples

library(MultivariateRandomForest)
y=matrix(runif(10*2),10,2)
Inv_Cov_Y=solve(cov(y))
Command=2
#Command=2 for MRF and 1 for RF
#This function calculates information gain of a node
Cost=Node_cost(y,Inv_Cov_Y,Command)



