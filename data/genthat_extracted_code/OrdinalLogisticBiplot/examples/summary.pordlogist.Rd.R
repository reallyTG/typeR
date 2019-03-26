library(OrdinalLogisticBiplot)


### Name: summary.pordlogist
### Title: Summary Method Function for Objects of Class 'pordlogist'
### Aliases: summary.pordlogist
### Keywords: summary

### ** Examples

data(LevelSatPhd)
dataSet = CheckDataSet(LevelSatPhd)
datanom = dataSet$datanom
olb = OrdinalLogBiplotEM(datanom,dim = 2, nnodos = 10, tol = 0.001,
  maxiter = 100, penalization = 0.2)
model = pordlogist(datanom[, 1], olb$RowCoordinates, tol = 0.001,
  maxiter = 100, penalization = 0.2)
summary(model)



