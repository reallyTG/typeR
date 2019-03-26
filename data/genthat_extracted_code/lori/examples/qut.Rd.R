library(lori)


### Name: qut
### Title: Automatic selection of nuclear norm regularization parameter
### Aliases: qut

### ** Examples

X = matrix(rnorm(30), 15)
Y = matrix(rpois(15, 1:15), 5)
lambda = qut(Y,X, 10, N=10)



