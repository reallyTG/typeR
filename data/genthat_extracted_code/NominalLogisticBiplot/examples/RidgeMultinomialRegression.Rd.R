library(NominalLogisticBiplot)


### Name: RidgeMultinomialRegression
### Title: Ridge Multinomial Logistic Regression
### Aliases: RidgeMultinomialRegression
### Keywords: models logistic

### ** Examples

  
  data(HairColor)
  data = data.matrix(HairColor)
  G = NominalMatrix2Binary(data)
  mca=afc(G,dim=2)
  depVar = data[,1]
  rmr = RidgeMultinomialRegression(depVar,mca$RowCoordinates[,1:2],penalization=0.1)
  rmr
  



