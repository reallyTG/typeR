library(NoiseFiltersR)


### Name: IPF
### Title: Iterative Partitioning Filter
### Aliases: IPF IPF.default IPF.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D # We fix a seed since there exists a random folds partition for the ensemble
##D set.seed(1)
##D out <- IPF(Species~., data = iris, s = 2)
##D summary(out, explicit = TRUE)
##D identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])
## End(Not run)



