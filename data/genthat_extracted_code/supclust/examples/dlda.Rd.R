library(supclust)


### Name: dlda
### Title: Classification with Wilma's Clusters
### Aliases: dlda nnr logreg aggtrees
### Keywords: classif

### ** Examples

## Generating random learning data: 20 observations and 10 variables (clusters)
set.seed(342)
xlearn <- matrix(rnorm(200), nrow = 20, ncol = 10)

## Generating random test data: 8 observations and 10 variables(clusters)
xtest  <- matrix(rnorm(80),  nrow = 8,  ncol = 10)

## Generating random class labels for the learning data
ylearn <- as.numeric(runif(20)>0.5)

## Predicting the class labels for the test data
nnr(xlearn, xtest, ylearn)
dlda(xlearn, xtest, ylearn)
logreg(xlearn, xtest, ylearn)
aggtrees(xlearn, xtest, ylearn)



