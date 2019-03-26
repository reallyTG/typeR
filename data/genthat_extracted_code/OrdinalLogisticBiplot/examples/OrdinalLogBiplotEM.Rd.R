library(OrdinalLogisticBiplot)


### Name: OrdinalLogBiplotEM
### Title: Alternated EM algorithm for Ordinal Logistic Biplots
### Aliases: OrdinalLogBiplotEM
### Keywords: EM algorithm

### ** Examples

    data(LevelSatPhd)
    dataSet = CheckDataSet(LevelSatPhd)
    datanom = dataSet$datanom
    olb = OrdinalLogBiplotEM(datanom,dim = 2, nnodos = 10,
          tol = 0.001, maxiter = 100, penalization = 0.2)
    olb



