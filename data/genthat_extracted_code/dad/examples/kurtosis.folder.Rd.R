library(dad)


### Name: kurtosis.folder
### Title: Kurtosis coefficients of a folder of data sets
### Aliases: kurtosis.folder kurtosisf

### ** Examples

# First example: iris (Fisher)               
data(iris)
iris.fold <- as.folder(iris, "Species")
iris.kurtosis <- kurtosis.folder(iris.fold)
print(iris.kurtosis)

# Second example: roses
data(roses)
roses.fold <- as.folder(roses, "rose")
roses.kurtosis <- kurtosis.folder(roses.fold)
print(roses.kurtosis)



