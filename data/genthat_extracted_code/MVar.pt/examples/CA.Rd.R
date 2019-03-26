library(MVar.pt)


### Name: CA
### Title: Analise de correspondencia (CA).
### Aliases: CA
### Keywords: Analise de correspondencia simples Analise de correspondencia
###   multipla CA MCA

### ** Examples

data(DataFreq) # conjunto de dados de frequencia

Data <- DataFreq[,2:ncol(DataFreq)]

rownames(Data) <- as.character(t(DataFreq[1:nrow(DataFreq),1]))

Resp <- CA(Data, "f") # realiza CA

print("Existe dependencia entre as linhas e as colunas?"); Resp$DepData

print("Numero de coordenadas principais:"); Resp$NumCood

print("Coordenadas principais das Linhas:"); round(Resp$MatrixX,2)

print("Coordenadas principais das Colunas:"); round(Resp$MatrixY,2)

print("Inercias das componentes principais:"); round(Resp$MatrixAutoVlr,2)



