library(FactoMineR)


### Name: RegBest
### Title: Select variables in multiple linear regression
### Aliases: RegBest
### Keywords: models

### ** Examples

data(milk)
res = RegBest(y=milk[,6],x=milk[,-6])
res$best



