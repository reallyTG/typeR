library(rerf)


### Name: OOBPredict
### Title: Compute out-of-bag predictions
### Aliases: OOBPredict

### ** Examples

library(rerf)
X <- as.matrix(iris[, 1:4])
Y <- iris[[5L]]
forest <- RerF(X, Y, store.oob = TRUE, num.cores = 1L)
predictions <- OOBPredict(X, forest, num.cores = 1L)
oob.error <- mean(predictions != Y)



