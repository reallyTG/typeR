library(DiceEval)


### Name: MAE
### Title: Mean Absolute Error
### Aliases: MAE
### Keywords: models

### ** Examples

X	<- seq(-1,1,0.1)
Y	<- 3*X + rnorm(length(X),0,0.5)
Ypred	<- 3*X
MAE(Y,Ypred)



