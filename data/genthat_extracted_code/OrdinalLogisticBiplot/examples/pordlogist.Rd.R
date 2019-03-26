library(OrdinalLogisticBiplot)


### Name: pordlogist
### Title: Ordinal logistic regression with ridge penalization
### Aliases: pordlogist
### Keywords: logistic models

### ** Examples

  
data(LevelSatPhd)
dataSet = CheckDataSet(LevelSatPhd)
datanom = dataSet$datanom
olb = OrdinalLogBiplotEM(datanom,dim = 2, nnodos = 10,
            tol = 0.001, maxiter = 100, penalization = 0.2)
model = pordlogist(datanom[, 1], olb$RowCoordinates, tol = 0.001,
        maxiter = 100, penalization = 0.2)
model

  



