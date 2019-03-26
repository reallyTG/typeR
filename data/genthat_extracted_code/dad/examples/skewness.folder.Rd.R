library(dad)


### Name: skewness.folder
### Title: Skewness coefficients of a folder of data sets
### Aliases: skewness.folder skewnessf

### ** Examples

# First example: iris (Fisher)               
data(iris)
iris.fold <- as.folder(iris, "Species")
iris.skewness <- skewness.folder(iris.fold)
print(iris.skewness)

# Second example: roses
data(roses)
roses.fold <- as.folder(roses, "rose")
roses.skewness <- skewness.folder(roses.fold)
print(roses.skewness)



