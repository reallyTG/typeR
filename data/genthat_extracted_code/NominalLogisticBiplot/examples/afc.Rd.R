library(NominalLogisticBiplot)


### Name: afc
### Title: Simple Correspondence Analysis
### Aliases: afc
### Keywords: correspondence analysis

### ** Examples

  
  data(HairColor)
  G = NominalMatrix2Binary(data.matrix(HairColor))
	mca=afc(G,dim=2)
  mca
  



