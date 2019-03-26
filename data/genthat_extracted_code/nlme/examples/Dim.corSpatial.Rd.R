library(nlme)


### Name: Dim.corSpatial
### Title: Dimensions of a corSpatial Object
### Aliases: Dim.corSpatial
### Keywords: models

### ** Examples

Dim(corGaus(), getGroups(Orthodont))

cs1ARMA <- corARMA(0.4, form = ~ 1 | Subject, q = 1)
cs1ARMA <- Initialize(cs1ARMA, data = Orthodont)
Dim(cs1ARMA)



