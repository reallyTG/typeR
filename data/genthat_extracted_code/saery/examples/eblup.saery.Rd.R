library(saery)


### Name: eblup.saery
### Title: The function 'eblup.saery' calculate the eblup and mse for a
###   model.
### Aliases: eblup.saery eblup.saery.AR1 eblup.saery.MA1 eblup.saery.indep
### Keywords: sae eblup REML saery

### ** Examples


sigma2edi <- datos[,6]
X <- as.matrix(datos[,5])
ydi <- datos[,3]
D <- length(unique(datos[,1]))
md <- rep(length(unique(datos[,2])), D)

#For computational reasons B is too low. We recomend to increase up to 100
eblup.output.ar1 <- eblup.saery(X, ydi, D, md, sigma2edi, model = "a", plot = TRUE, B = 2)
eblup.output.ar1

#For computational reasons B is too low. We recomend to increase up to 100
eblup.output.ma1 <- eblup.saery(X, ydi, D, md, sigma2edi,
                    model = "ma", plot = FALSE, type = "II", B = 2)
eblup.output.ma1

eblup.output.indep <- eblup.saery(X, ydi, D, md, sigma2edi,
                      model = "i", plot = TRUE)
eblup.output.indep



