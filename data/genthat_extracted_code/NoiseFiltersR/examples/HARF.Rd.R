library(NoiseFiltersR)


### Name: HARF
### Title: High Agreement Random Forest
### Aliases: HARF HARF.default HARF.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D # We fix a seed since there exists a random partition for the ensemble
##D set.seed(1)
##D out <- HARF(Species~., data = iris, ntrees = 100)
##D print(out)
##D identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])
## End(Not run)



