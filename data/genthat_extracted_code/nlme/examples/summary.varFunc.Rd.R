library(nlme)


### Name: summary.varFunc
### Title: Summarize varFunc Object
### Aliases: summary.varFunc summary.varComb summary.varConstPower
###   summary.varExp summary.varFixed summary.varIdent summary.varPower
### Keywords: models

### ** Examples

vf1 <- varPower(0.3, form = ~age)
vf1 <- Initialize(vf1, Orthodont)
summary(vf1)



