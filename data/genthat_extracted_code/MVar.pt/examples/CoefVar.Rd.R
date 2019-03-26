library(MVar.pt)


### Name: CoefVar
### Title: Coeficiente de variacao dos dados.
### Aliases: CoefVar
### Keywords: Coeficiente de variacao. CoefVar

### ** Examples

data(DataQuan) # conjunto de dados 

Data <- DataQuan[,2:8]

Resp <- CoefVar(Data, Type = 1) # coeficiente de variacao global
round(Resp,2)

Resp <- CoefVar(Data, Type = 2) # coeficiente de variacao por coluna
round(Resp,2)



