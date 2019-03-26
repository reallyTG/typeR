library(MVar.pt)


### Name: PP_Index
### Title: Funcao para encontrar os indices da projection pursuit (PP).
### Aliases: PP_Index
### Keywords: Projection pursuit PP

### ** Examples

data(iris) # conjunto de dados

Data <- iris[,1:4]

# Exemplo 1 - Sem as classes nos dados
Ind <- PP_Index(Data = Data, Class = NA, Vector.Proj = NA, 
                Findex = "moment", DimProj = 2, Weight = TRUE, 
                Lambda = 0.1, r = 1)

print("Numero de classes:"); Ind$Num.Class
print("Nomes das classes:"); Ind$Class.Names
print("Funcao indice de projecao:"); Ind$Findex
print("Vetores de projecao:"); Ind$Vector.Proj  
print("Indice de projecao:"); Ind$Index


# Exemplo 2 - Com as classes nos dados
Class <- iris[,5] # classe dos dados

FcIndex <- "pda" # funcao indice

Sphere <- TRUE # Dados esfericos

Res <- PP_Optimizer(Data = Data, Class = Class, Findex = FcIndex,
                    OptMethod = "SA", DimProj = 2, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 1000, Half = 30)

# Comparando o resultado obtido
if (match(toupper(FcIndex),c("LDA", "PDA", "LR"), nomatch = 0) > 0) {
  if (Sphere) {
     Data <- apply(predict(prcomp(Data)), 2, scale) # dados esfericos
  }
} else Data <- as.matrix(Res$Proj.Data[,1:Dim])

Ind <- PP_Index(Data = Data, Class = Class, Vector.Proj = Res$Vector.Opt, 
                Findex = FcIndex, DimProj = 2, Weight = TRUE, Lambda = 0.1,
                r = 1)

print("Numero de classes:"); Ind$Num.Class
print("Nomes das classes:"); Ind$Class.Names
print("Funcao indice de projecao:"); Ind$Findex
print("Vetores de projecao:"); Ind$Vector.Proj  
print("Indice de projecao:"); Ind$Index
print("Indice de projecao otimizado:"); Res$Index[length(Res$Index)]



