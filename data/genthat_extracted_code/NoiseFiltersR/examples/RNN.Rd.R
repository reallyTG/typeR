library(NoiseFiltersR)


### Name: RNN
### Title: Reduced Nearest Neighbors
### Aliases: RNN RNN.default RNN.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D out <- RNN(Species~., data = iris)
##D print(out)
##D identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])
## End(Not run)



