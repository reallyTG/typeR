library(MVar.pt)


### Name: CCA
### Title: Analise de correlacao canonica (CCA).
### Aliases: CCA
### Keywords: Analise de correlacao canonica CCA

### ** Examples

data(DataMix) # conjunto de dados

Data <- DataMix[,2:ncol(DataMix)]

rownames(Data) <- DataMix[,1]

X <- as.data.frame(NormData(Data[,1:2],2))

Y <- as.data.frame(NormData(Data[,5:6],2))

Resp <- CCA(X, Y, Type = 1, Test = "Bartlett", Sign = 0.05)

print("Matriz com autovalores (variancias) dos pares cononicos U e V:");
round(Resp$Var.UV,3)

print("Matriz de correlacao dos pares cononicos U e V:"); round(Resp$Corr.UV,3)

print("Matriz dos coeficientes canonicos do grupo X:"); round(Resp$Coef.X,3)

print("Matriz dos coeficientes canonicos do grupo Y:"); round(Resp$Coef.Y,3)

print("Matriz das correlacoes entre as variaveis canonicas
       e as variaveis originais do grupo X:"); round(Resp$Coor.X,3)

print("Matriz das correlacoes entre as variaveis canonicas
       e as variaveis originais do grupo Y:"); round(Resp$Coor.Y,3)

print("Matriz com os scores do grupo X:"); round(Resp$Score.X,3)

print("Matriz com os scores do grupo Y:"); round(Resp$Score.Y,3)

print("Teste de significancia dos pares canonicos:"); Resp$SigTest



