library(nlme)


### Name: coef.corStruct
### Title: Coefficients of a corStruct Object
### Aliases: coef.corStruct coef.corAR1 coef.corARMAd coef.corCAR1
###   coef.corCompSymm coef.corHF coef.corIdent coef.corLin coef.corNatural
###   coef.corSpatial coef.corSpher coef.corSymm coef<-.corStruct
###   coef<-.corAR1 coef<-.corARMA coef<-.corCAR1 coef<-.corCompSymm
###   coef<-.corNatural coef<-.corHF coef<-.corIdent coef<-.corLin
###   coef<-.corSpatial coef<-.corSpher coef<-.corSymm coef.summary.nlsList
### Keywords: models

### ** Examples

cst1 <- corARMA(p = 1, q = 1)
coef(cst1)



