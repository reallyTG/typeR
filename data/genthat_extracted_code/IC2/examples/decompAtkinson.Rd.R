library(IC2)


### Name: decompAtkinson
### Title: Decomposition by Groups for Atkinson Index
### Aliases: decompAtkinson

### ** Examples

data(hhbudgets)

decompAtkinson(hhbudgets[,"ingreso"], hhbudgets[,"estructura"], epsilon=3)
summary(hhbudgets[,"tenencia"]) # 35 NA's
summary(decompAtkinson(x=hhbudgets[,"transporte"], z=hhbudgets[,"tenencia"], w=hhbudgets[,"factor"], decomp="DP", ELMO=FALSE))
summary(decompAtkinson(x=hhbudgets[,"transporte"], z=hhbudgets[,"tenencia"], w=hhbudgets[,"factor"], decomp="DP", epsilon=0.25))



