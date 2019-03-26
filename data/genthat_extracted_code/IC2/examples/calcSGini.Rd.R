library(IC2)


### Name: calcSGini
### Title: Extended Gini Coefficient
### Aliases: calcSGini

### ** Examples

data(hhbudgets)

calcSGini(hhbudgets[,"ingreso"], param=0.5)
summary(hhbudgets[,"mantenimiento"])
calcSGini(hhbudgets[,"mantenimiento"], w=hhbudgets[,"factor"])



