library(IC2)


### Name: decompGEI
### Title: Decomposition by Groups for GEI
### Aliases: decompGEI

### ** Examples

data(hhbudgets)

decompGEI(hhbudgets[,"ingreso"], hhbudgets[,"estructura"], alpha=4)
summary(hhbudgets[,"tenencia"]) #35 NA's
decompGEI(x=hhbudgets[,"transporte"], z=hhbudgets[,"tenencia"], w=hhbudgets[,"factor"], ELMO=FALSE)
summary(decompGEI(x=hhbudgets[,"transporte"], z=hhbudgets[,"tenencia"], w=hhbudgets[,"factor"], alpha=1.5))



