library(NoiseFiltersR)


### Name: GE
### Title: Generalized Edition
### Aliases: GE GE.default GE.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D out <- GE(iris)
##D summary(out, explicit = TRUE)
##D # We check that the process was correct
##D irisCopy <- iris
##D irisCopy[out$repIdx,5] <- out$repLab
##D cleanData <- irisCopy[setdiff(1:nrow(iris),out$remIdx),]
##D identical(out$cleanData,cleanData)
## End(Not run)



