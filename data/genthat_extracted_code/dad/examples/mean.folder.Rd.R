library(dad)


### Name: mean.folder
### Title: Means of a folder of data sets
### Aliases: mean.folder meanf

### ** Examples

# First example: iris (Fisher)               
data(iris)
iris.fold <- as.folder(iris, "Species")
iris.means <- mean(iris.fold)
print(iris.means)

# Second example: roses
data(roses)
roses.fold <- as.folder(roses, "rose")
roses.means <- mean(roses.fold)
print(roses.means)



