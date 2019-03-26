library(NoiseFiltersR)


### Name: CNN
### Title: Condensed Nearest Neighbors
### Aliases: CNN CNN.default CNN.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D out <- CNN(iris)
##D print(out)
##D length(out$remIdx)
##D identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])
## End(Not run)



