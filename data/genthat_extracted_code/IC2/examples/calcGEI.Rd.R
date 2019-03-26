library(IC2)


### Name: calcGEI
### Title: Generalized Entropy Index
### Aliases: calcGEI

### ** Examples

data(hhbudgets)

summary(hhbudgets[, "transporte"])
calcGEI(hhbudgets[,"transporte"], alpha=3)
summary(calcGEI(hhbudgets[,"ingreso"], w=hhbudgets[,"factor"]))



