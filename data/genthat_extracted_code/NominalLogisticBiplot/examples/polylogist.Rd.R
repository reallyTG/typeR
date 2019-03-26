library(NominalLogisticBiplot)


### Name: polylogist
### Title: Multinomial logistic regression with ridge penalization
### Aliases: polylogist
### Keywords: ridge logistic models

### ** Examples

  
  data(HairColor)
  data = data.matrix(HairColor)
  G = NominalMatrix2Binary(data)
  mca=afc(G,dim=2)
  depVar = data[,1]
  nomreg = polylogist(depVar,mca$RowCoordinates[,1:2],penalization=0.1)
  nomreg
  



