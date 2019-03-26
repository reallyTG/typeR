library(NoiseFiltersR)


### Name: CVCF
### Title: Cross-Validated Committees Filter
### Aliases: CVCF CVCF.default CVCF.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D # We fix a seed since there exists a random partition for the ensemble
##D set.seed(1)
##D out <- CVCF(Species~.-Sepal.Width, data = iris)
##D print(out)
##D identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])
## End(Not run)



