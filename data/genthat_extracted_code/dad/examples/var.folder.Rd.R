library(dad)


### Name: var.folder
### Title: Variance matrices of a folder of data sets
### Aliases: var.folder varf

### ** Examples

# First example: iris (Fisher)               
data(iris)
iris.fold <- as.folder(iris, "Species")
iris.vars <- var.folder(iris.fold)
print(iris.vars)

# Second example: roses
data(roses)
roses.fold <- as.folder(roses, "rose")
roses.vars <- var.folder(roses.fold)
print(roses.vars)



