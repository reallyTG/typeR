library(nestfs)


### Name: forward.selection
### Title: Run forward selection
### Aliases: forward.selection
### Keywords: multivariate

### ** Examples

# register a parallel cluster with two cores
library(doParallel)
registerDoParallel(2)

data(diabetes)
fs.res <- forward.selection(X.diab, Y.diab, ~ age + sex, family=gaussian(),
                            choose.from=1:10, num.inner.folds=5, max.iters=3)
summary(fs.res)

# close the parallel cluster
stopImplicitCluster()




