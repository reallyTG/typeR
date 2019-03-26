library(glmpath)


### Name: bootstrap.path
### Title: Generates a set of bootstrap coefficients for glmpath or coxpath
### Aliases: bootstrap.path
### Keywords: models regression

### ** Examples

data(heart.data)
attach(heart.data)
bootstrap.a <- bootstrap.path(x, y, B=5, method="bic")
detach(heart.data)
data(lung.data)
attach(lung.data)
bootstrap.b <- bootstrap.path(data=lung.data, B=5, path="coxpath")
detach(lung.data)



