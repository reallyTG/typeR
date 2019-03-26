library(IC2)


### Name: summary.ICI
### Title: Summarize a ICI Object
### Aliases: summary.ICI

### ** Examples

data(hhbudgets)

summary(calcAtkinson(hhbudgets[,"ingreso"], epsilon=3), digits=3)
summary(decompGEI(hhbudgets[,"ingreso"], hhbudgets[,"estructura"], alpha=1.1))



