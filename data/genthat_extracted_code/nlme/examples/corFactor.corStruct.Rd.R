library(nlme)


### Name: corFactor.corStruct
### Title: Factor of a corStruct Object Matrix
### Aliases: corFactor.compSymm corFactor.corAR1 corFactor.corARMA
###   corFactor.corCAR1 corFactor.corNatural corFactor.corSpatial
###   corFactor.corStruct corFactor.corSymm
### Keywords: models

### ** Examples

cs1 <- corAR1(form = ~1 | Subject)
cs1 <- Initialize(cs1, data = Orthodont)
corFactor(cs1)



