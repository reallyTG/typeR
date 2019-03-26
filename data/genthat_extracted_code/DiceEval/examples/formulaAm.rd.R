library(DiceEval)


### Name: formulaAm
### Title: Construction of a formula Y~s(X1)+...+s(Xp)
### Aliases: formulaAm
### Keywords: models regression internal

### ** Examples

data(dataIRSN5D)
X <- dataIRSN5D[,1:5]
Y <- dataIRSN5D[,6]
formulaAm(X,Y)



