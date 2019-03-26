library(DiceEval)


### Name: RMSE
### Title: Root Mean Squared Error
### Aliases: RMSE
### Keywords: models

### ** Examples

X    <- seq(-1,1,0.1)
Y    <- 3*X + rnorm(length(X),0,0.5)
Ypred <- 3*X
print(RMSE(Y,Ypred))



