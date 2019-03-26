library(MVar.pt)


### Name: FA
### Title: Analise fatorial (FA).
### Aliases: FA
### Keywords: Analise Fatorial FA

### ** Examples

data(DataQuan) # conjunto de dados

Data <- DataQuan[,2:ncol(DataQuan)]

rownames(Data) <- DataQuan[,1]

Resp <- FA(Data, Method = "PC", Type = 2, NFactor = 3, Rotation = "None",
           ScoresObs = "Bartlett", Converg = 1e-5, Iteracao = 1000, 
           TestFit = TRUE) 

print("Matriz com todos os resultados associados:"); round(Resp$MatrixResult,3)

print("Soma dos Quadrados dos Residuos:"); round(Resp$VlrSQR,3)

print("Matriz das Cargas Fatoriais:"); round(Resp$MatrixCarga,3)

print("Matriz com os escores das observacoes:"); round(Resp$MatrixScores,3)

print("Matriz com os escores dos coeficientes dos fatores:"); round(Resp$CoefScores,3)




