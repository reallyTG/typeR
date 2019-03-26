library(OrdinalLogisticBiplot)


### Name: plotOrdinalFittedVariable
### Title: Function that gives the posibility for the user for plotting in
###   the reduced space an ordered and fitted categorical variable.
### Aliases: plotOrdinalFittedVariable
### Keywords: plot

### ** Examples

data(LevelSatPhd)
olbo = OrdinalLogisticBiplot(LevelSatPhd,sFormula=NULL,
      numFactors=2,method="EM",penalization=0.2)
nameVariable="Salary"
coeffic = c(olbo$coefs[1,],olbo$thresholds[1,])
plotOrdinalFittedVariable(nameVariable,coeffic,D=1,numFactors = 2)




