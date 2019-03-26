library(DiceEval)


### Name: R2
### Title: Multiple R-Squared
### Aliases: R2
### Keywords: models

### ** Examples

X	<- seq(-1,1,0.1)
Y	<- 3*X + rnorm(length(X),0,0.5)
Ypred	<- 3*X
print(R2(Y,Ypred))



