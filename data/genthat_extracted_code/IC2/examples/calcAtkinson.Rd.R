library(IC2)


### Name: calcAtkinson
### Title: Atkinson Index of Inequality
### Aliases: calcAtkinson

### ** Examples

data(hhbudgets)

calcAtkinson(hhbudgets[, "ingreso"], epsilon=3)
summary(hhbudgets[, "transporte"])
calcAtkinson(hhbudgets[,"transporte"], w=hhbudgets[,"factor"])



