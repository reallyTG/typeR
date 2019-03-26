### R code from vignette source 'Guide.Stex'

###################################################
### code chunk number 1: Guide.Stex:6-7
###################################################
 options(continue="  ")


###################################################
### code chunk number 2: Guide.Stex:12-13
###################################################
library("GPArotation")  


###################################################
### code chunk number 3: Guide.Stex:27-30
###################################################
  data(ability.cov)
  z <- factanal(factors = 2, covmat = ability.cov, rotation="oblimin")
  loadings(z)


