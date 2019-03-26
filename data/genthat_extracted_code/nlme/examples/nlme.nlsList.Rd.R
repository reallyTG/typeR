library(nlme)


### Name: nlme.nlsList
### Title: NLME fit from nlsList Object
### Aliases: nlme.nlsList
### Keywords: models

### ** Examples

fm1 <- nlsList(SSasymp, data = Loblolly)
fm2 <- nlme(fm1, random = Asym ~ 1)
summary(fm1)
summary(fm2)



