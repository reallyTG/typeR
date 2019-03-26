library(RcmdrPlugin.TeachStat)


### Name: Agrupadas
### Title: Grouped or tabulated data set
### Aliases: Agrupadas
### Keywords: datasets

### ** Examples

data(Agrupadas)
calcularResumenDatosTabulados(l_inf=Agrupadas$Linf, l_sup=Agrupadas$Lsup,
  ni=Agrupadas$ni, statistics =c("mean", "sd", "IQR", "quantiles"), quantiles
  = c(0,0.25,0.5,0.75,1), tablaFrecuencia=FALSE)




