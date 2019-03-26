library(FactoMineR)


### Name: milk
### Title: milk
### Aliases: milk
### Keywords: datasets

### ** Examples


data(milk)
res = RegBest(y=milk[,6],x=milk[,-6])
res$best



