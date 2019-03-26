library(sprsmdl)


### Name: SlrArd
### Title: Sparse Logistic Regression
### Aliases: SlrArd
### Keywords: models regression

### ** Examples

data(iris)

tmp <- iris[iris$Species != 'versicolor',]
T <- tmp$Species == 'setosa'
X <- as.matrix(tmp[,1:4])

res <- SlrArd(T, X, bias=TRUE, method="VB", control = list(maxit=500))
print(coefficients(res))

res <- SlrArd(T, X, bias=TRUE, method="VBMacKay")  ## faster
print(coefficients(res))

res <- SlrArd(T, X, bias=FALSE, method="VBMacKay")  ## without bias
print(coefficients(res))



