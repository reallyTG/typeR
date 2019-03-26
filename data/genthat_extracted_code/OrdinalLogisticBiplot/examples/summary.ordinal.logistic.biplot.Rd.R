library(OrdinalLogisticBiplot)


### Name: summary.ordinal.logistic.biplot
### Title: Summary Method Function for Objects of Class
###   'ordinal.logistic.biplot'
### Aliases: summary.ordinal.logistic.biplot
### Keywords: summary

### ** Examples

data(LevelSatPhd)
olbo = OrdinalLogisticBiplot(LevelSatPhd,sFormula=NULL,numFactors=2,
method="EM",penalization=0.2,show=FALSE)
summary(olbo)



