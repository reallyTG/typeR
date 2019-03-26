library(nlme)


### Name: Initialize.corStruct
### Title: Initialize corStruct Object
### Aliases: Initialize.corStruct Initialize.corAR1 Initialize.corARMA
###   Initialize.corCAR1 Initialize.corCompSymm Initialize.corHF
###   Initialize.corIdent Initialize.corLin Initialize.corNatural
###   Initialize.corSpatial Initialize.corSpher Initialize.corSymm
### Keywords: models

### ** Examples

cs1 <- corAR1(form = ~ 1 | Subject)
cs1 <- Initialize(cs1, data = Orthodont)



