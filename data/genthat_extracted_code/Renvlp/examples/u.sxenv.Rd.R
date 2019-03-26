library(Renvlp)


### Name: u.sxenv
### Title: Select the dimension of sxenv
### Aliases: u.sxenv

### ** Examples

data(sales)
Y <- sales[, 1:3]
X <- sales[, 4:7]
R <- rep(1, 4)

u <- u.sxenv(X, Y, R)
u



