### R code from vignette source 'divo-Vignette.Rnw'

###################################################
### code chunk number 1: divo-Vignette.Rnw:22-24
###################################################
#source("https://bioconductor.org/biocLite.R")
#biocLite("divo")


###################################################
### code chunk number 2: divo-Vignette.Rnw:35-38
###################################################
library(divo)
data(TCR.Data)
result <- i.inp(x, resample = 100)


###################################################
### code chunk number 3: divo-Vignette.Rnw:42-45
###################################################
data(TCR.Data)
DP <- dp(x, resample = 100)
ENS <- ens(x, resample = 100)


