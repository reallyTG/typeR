library(saery)


### Name: fit.saery
### Title: The function 'fit.saery' is used to fit the correct model for
###   three options.
### Aliases: fit.saery fit.saery.AR1 fit.saery.MA1 fit.saery.indep
### Keywords: sae REML saery

### ** Examples


sigma2edi <- datos[,6]
X <- as.matrix(datos[,5])
ydi <- datos[,3]
D <- length(unique(datos[,1]))
md <- rep(length(unique(datos[,2])), D)

output.fit.ar1 <- fit.saery(X, ydi, D, md, sigma2edi, "AR", 0.9)
output.fit.ar1

output.fit.ma1 <- fit.saery(X, ydi, D, md, sigma2edi, "MA", 0.9)
output.fit.ma1

output.fit.indep <- fit.saery(X, ydi, D, md, sigma2edi, "indep", 0.9)
output.fit.indep



