library(NominalLogisticBiplot)


### Name: summary.nominal.logistic.biplot
### Title: Summary Method Function for Objects of Class
###   'nominal.logistic.biplot'
### Aliases: summary.nominal.logistic.biplot
### Keywords: summary

### ** Examples

data(HairColor)
nlbo = NominalLogisticBiplot(HairColor,sFormula=NULL,
numFactors=2,method="EM",penalization=0.2,show=FALSE)
summary(nlbo)



