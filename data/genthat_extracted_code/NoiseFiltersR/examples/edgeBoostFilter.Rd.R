library(NoiseFiltersR)


### Name: edgeBoostFilter
### Title: Edge Boosting Filter
### Aliases: edgeBoostFilter edgeBoostFilter.default
###   edgeBoostFilter.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D out <- edgeBoostFilter(Species~., data = iris, m = 10, percent = 0.05, threshold = 0)
##D print(out)
##D identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])
## End(Not run)



