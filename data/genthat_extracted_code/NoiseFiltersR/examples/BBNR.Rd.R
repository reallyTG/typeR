library(NoiseFiltersR)


### Name: BBNR
### Title: Blame Based Noise Reduction
### Aliases: BBNR BBNR.default BBNR.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D out <- BBNR(iris, k = 5)
##D print(out)
##D identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])
## End(Not run)



