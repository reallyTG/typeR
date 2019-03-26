library(saery)


### Name: saery-package
### Title: Small Area Estimation for Rao and Yu model
### Aliases: saery-package saery
### Keywords: package sae small area estimation

### ** Examples


sigma2edi <- datos[,6]
X <- as.matrix(datos[,5])
ydi <- datos[,3]
D <- length(unique(datos[,1]))
md <- rep(length(unique(datos[,2])), D)

output.fit.ar1 <- fit.saery(X, ydi, D, md, sigma2edi, "AR", 0.9)
output.fit.ar1

#For computational reasons B is too low. We recomend to increase up to 100
eblup.output.ar1 <- eblup.saery(X, ydi, D, md, sigma2edi, "a", plot = TRUE, B = 2)
eblup.output.ar1



