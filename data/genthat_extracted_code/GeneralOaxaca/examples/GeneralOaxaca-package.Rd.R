library(GeneralOaxaca)


### Name: GeneralOaxaca-package
### Title: Blinder-Oaxaca Decomposition for Generalized Linear Model
### Aliases: GeneralOaxaca-package
### Keywords: package

### ** Examples

data("chicago")
formula=ln.real.wage~ age + female + LTHS + some.college + college + advanced.degree
BO_A <- GeneralOaxaca(formula,  family= Gamma, data=chicago, groupInd=chicago$foreign.born,B=100)
BO_A$twofold 



