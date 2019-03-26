library(robustfa)


### Name: fsOrder
### Title: Compute the Ordered Factor Scores
### Aliases: fsOrder
### Keywords: robust

### ** Examples


data(stock611)
R611=cor(stock611[,3:12]); R611

## FS.pca contains scores etc.
fsPca=factorScorePca(x = stock611[,3:12], factors = 2, cor = TRUE, 
rotation = "varimax", scoresMethod = "regression"); fsPca

orderedFS=fsOrder(fsPca$scores); orderedFS




