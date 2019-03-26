library(NoiseFiltersR)


### Name: AENN
### Title: All-k Edited Nearest Neighbors
### Aliases: AENN AENN.default AENN.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D out <- AENN(Species~.-Petal.Length,iris)
##D print(out)
##D identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])
## End(Not run)



