library(Renvlp)


### Name: u.pred2.env
### Title: Select the dimension of the constructed partial envelope for
###   prediction based on envelope model
### Aliases: u.pred2.env

### ** Examples

data(fiberpaper)
X <- fiberpaper[, 5:7]
Y <- fiberpaper[, 1:4]

u <- u.pred2.env(X, Y, X[10, ])
u



