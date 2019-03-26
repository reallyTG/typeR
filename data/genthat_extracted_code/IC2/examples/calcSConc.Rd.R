library(IC2)


### Name: calcSConc
### Title: Concentration Index
### Aliases: calcSConc

### ** Examples

data(hhbudgets)

calcSConc(hhbudgets[, "transporte"], hhbudgets[,"ingreso"], param=0.5)
summary(hhbudgets[,"mantenimiento"])
calcSConc(hhbudgets[,"mantenimiento"], hhbudgets[,"ingreso"], w=hhbudgets[,"factor"])



