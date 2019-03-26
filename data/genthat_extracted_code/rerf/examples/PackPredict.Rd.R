library(rerf)


### Name: PackPredict
### Title: Compute class predictions for each observation in X
### Aliases: PackPredict

### ** Examples

library(rerf)
trainIdx <- c(1:40, 51:90, 101:140)
X <- as.matrix(iris[, 1:4])
Y <- as.numeric(iris[, 5])

paramList <- list(p = ncol(X), d = ceiling(sqrt(ncol(X))))

forest <- RerF(X, Y, FUN = RandMatRF, paramList = paramList, rfPack = TRUE, num.cores = 1)

predictions <- PackPredict(X)



