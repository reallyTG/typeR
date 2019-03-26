library(Renvlp)


### Name: u.xenv
### Title: Select the dimension of xenv
### Aliases: u.xenv

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 1:6]
Y <- wheatprotein[, 7]

u <- u.xenv(X, Y)
u



