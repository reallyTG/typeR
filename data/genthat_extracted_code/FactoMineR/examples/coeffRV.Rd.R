library(FactoMineR)


### Name: coeffRV
### Title: Calculate the RV coefficient and test its significance
### Aliases: coeffRV
### Keywords: multivariate

### ** Examples

data(wine)
X <- wine[,3:7]
Y <- wine[,11:20]
coeffRV(X,Y)



