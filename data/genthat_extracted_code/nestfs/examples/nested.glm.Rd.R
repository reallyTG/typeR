library(nestfs)


### Name: nested.glm
### Title: Cross-validated generalized linear models
### Aliases: nested.glm
### Keywords: multivariate

### ** Examples

# register a parallel cluster with two cores
library(doParallel)
registerDoParallel(2)

data(diabetes)
folds <- create.folds(10, nrow(X.diab), seed=1)
base.res <- nested.glm(X.diab, Y.diab, c("age", "sex", "bmi", "map"),
                       gaussian(), folds)

# close the parallel cluster
stopImplicitCluster()




