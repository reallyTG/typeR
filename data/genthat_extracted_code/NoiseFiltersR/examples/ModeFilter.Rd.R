library(NoiseFiltersR)


### Name: ModeFilter
### Title: Mode Filter
### Aliases: ModeFilter ModeFilter.default ModeFilter.formula

### ** Examples

# Next example is not run because in some cases it can be rather slow
## Not run: 
##D    data(iris)
##D    out <- ModeFilter(Species~., data = iris, type = "classical", noiseAction = "remove")
##D    print(out)
##D    identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])
## End(Not run)



