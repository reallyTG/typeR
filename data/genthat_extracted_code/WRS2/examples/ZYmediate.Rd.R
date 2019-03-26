library(WRS2)


### Name: ZYmediate
### Title: Robust mediation test
### Aliases: ZYmediate
### Keywords: models

### ** Examples

## Leerkes data: 
## Y: Efficacy
## X: MatCare
## M: Esteem

## fitting robust mediator regressions
require(MASS)
summary(rlm(Efficacy ~ MatCare, data = Leerkes))
summary(rlm(Esteem ~ MatCare, data = Leerkes))
summary(rlm(Efficacy ~ MatCare + Esteem, data = Leerkes))

## robust testing of mediating effect (indirect effect)
with(Leerkes, ZYmediate(MatCare, Efficacy, Esteem))



