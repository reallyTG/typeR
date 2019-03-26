library(NoiseFiltersR)


### Name: ORBoostFilter
### Title: Outlier Removal Boosting Filter
### Aliases: ORBoostFilter ORBoostFilter.default ORBoostFilter.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D out <- ORBoostFilter(Species~., data = iris, N = 10)
##D summary(out)
##D identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])
## End(Not run)



