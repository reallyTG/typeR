library(ramsvm)


### Name: ramsvm
### Title: The classifier for Reinforced Angle-Based Multicategory Support
###   Vector Machines (RAMSVMs).
### Aliases: ramsvm

### ** Examples

data(iris)
ramsvm(x = as.matrix(iris[,-5]),
       y = iris[,5],
       lambda = 0.2,
       kernel="gaussian")



