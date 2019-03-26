library(rrcov)


### Name: QdaCov
### Title: Robust Quadratic Discriminant Analysis
### Aliases: QdaCov QdaCov.formula QdaCov.default
### Keywords: robust multivariate

### ** Examples

## Example anorexia
library(MASS)
data(anorexia)

## start with the classical estimates
qda <- QdaClassic(Treat~., data=anorexia)
predict(qda)@classification

## try now the robust LDA with the default method (MCD with pooled whitin cov matrix)
rqda <- QdaCov(Treat~., data= anorexia)
predict(rqda)@classification

## try the other methods
QdaCov(Treat~., data= anorexia, method="sde")
QdaCov(Treat~., data= anorexia, method="M")
QdaCov(Treat~., data= anorexia, method=CovControlOgk())




