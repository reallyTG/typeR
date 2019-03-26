library(OrdinalLogisticBiplot)


### Name: plotOrdinalVariable
### Title: This function plots in the reduced space an ordered categorical
###   variable.
### Aliases: plotOrdinalVariable
### Keywords: plot

### ** Examples

data(LevelSatPhd)
olbo = OrdinalLogisticBiplot(LevelSatPhd,sFormula=NULL,
  numFactors=2,method="EM")
ordinalfVar = factor(LevelSatPhd[,1],ordered=TRUE)
levels(ordinalfVar) = c("VS","SS","SD","VD")
estimRows = olbo$RowCoords
nameVariable = "Salary"   
plotOrdinalVariable(ordinalfVar,nameVariable,estimRows,planex = 1,
  planey = 2,xi=-1.5,xu=1.5,yi=-1.5,yu=1.5,
  margin=0.2,CexVar=0.7,showIIC = TRUE)     



