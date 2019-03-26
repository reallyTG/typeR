library(MVar.pt)


### Name: PCA
### Title: Analise de componentes principais (PCA).
### Aliases: PCA
### Keywords: Analise de componentes principais PCA

### ** Examples

data(DataQuan) # conjunto de dados quantitativos

Data <- DataQuan[,2:8]

rownames(Data) <- DataQuan[1:nrow(DataQuan),1]

PC <- PCA(Data, 2) # executa o PCA

print("Matriz de Covariancia/Correlacao:"); round(PC$MatrixMC,2)

print("Componentes Principais:"); round(PC$MatrixAutoVec,2)

print("Variancias dos Componentes Principais:"); round(PC$MatrixAutoVlr,2)

print("Covariancia dos Componentes Principais:"); round(PC$MatrixVCP,2)

print("Correlacao dos Componentes Principais:"); round(PC$MatrixCCP,2)

print("Escores dos Componentes Principais:"); round(PC$MatrixEsc,2)



