library(recommenderlab)


### Name: Error
### Title: Error Calculation
### Aliases: RMSE frobenius MSE MAE

### ** Examples

true <- rnorm(10)
predicted <- rnorm(10)

MAE(true, predicted)
MSE(true, predicted)
RMSE(true, predicted)

true <- matrix(rnorm(9), nrow = 3)
predicted <- matrix(rnorm(9), nrow = 3)

frobenius(true, predicted)



