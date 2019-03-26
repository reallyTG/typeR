library(nestfs)


### Name: nested.forward.selection
### Title: Run nested forward selection
### Aliases: nested.forward.selection
### Keywords: multivariate

### ** Examples

# register a parallel cluster with two cores
library(doParallel)
registerDoParallel(2)

data(diabetes)
folds <- create.folds(2, nrow(X.diab), seed=1)
nestfs.res <- nested.forward.selection(X.diab, Y.diab, ~ age + sex,
                                       gaussian(), folds, choose.from=1:10,
                                       num.inner.folds=5, max.iters=3)
summary(nestfs.res)

# close the parallel cluster
stopImplicitCluster()




