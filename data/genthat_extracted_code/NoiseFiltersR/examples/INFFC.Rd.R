library(NoiseFiltersR)


### Name: INFFC
### Title: Iterative Noise Filter based on the Fusion of Classifiers
### Aliases: INFFC INFFC.default INFFC.formula

### ** Examples

# Next example is not run because it might be time-consuming
## Not run: 
##D data(iris)
##D out <- INFFC(Species~., data = iris)
##D summary(out)
##D identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])
## End(Not run)



