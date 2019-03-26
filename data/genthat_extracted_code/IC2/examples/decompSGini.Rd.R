library(IC2)


### Name: decompSGini
### Title: Decomposition by Groups for Extended Gini Coefficient
### Aliases: decompSGini

### ** Examples

data(hhbudgets)

decompSGini(x=hhbudgets[,"ingreso"], z=hhbudgets[,"estructura"], param=4)
decompSGini(x=hhbudgets[,"transporte"], z=hhbudgets[,"estructura"], w=hhbudgets[,"factor"], decomp="YL", ELMO=FALSE)
summary(decompSGini(x=hhbudgets[,"transporte"], z=hhbudgets[,"tenencia"], w=hhbudgets[,"factor"], param=1.5))



