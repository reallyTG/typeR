library(MVar.pt)


### Name: PP_Optimizer
### Title: Funcao de otimizacao dos indices da projection pursuit (busca de
###   projecao).
### Aliases: PP_Optimizer
### Keywords: Projection pursuit PP

### ** Examples

data(iris) # conjunto de dados

# Exemplo 1 - Sem as classes nos dados
Data <- iris[,1:4]

Class <- NA # classe dos dados

FcIndex <- "kurtosismax" # funcao indice

Dim <- 1 # dimensao da projecao dos dados

Sphere <- TRUE # Dados esfericos

Res <- PP_Optimizer(Data = Data, Class = Class, Findex = FcIndex,
                    OptMethod = "GTSA", DimProj = Dim, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 1000, Half = 30)
 
print("Numero de classes:"); Res$Num.Class
print("Nomes das classes:"); Res$Class.Names
print("Funcao indice de projecao:"); Res$Findex
print("Dados projetados:"); Res$Proj.Data
print("Vetores de projecao:"); Res$Vector.Opt
print("Indices de projecao:"); Res$Index


# Exemplo 2 - Com as classes nos dados
Class <- iris[,5] # classe dos dados

Res <- PP_Optimizer(Data = Data, Class = Class, Findex = FcIndex,
                    OptMethod = "GTSA", DimProj = Dim, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 1000, Half = 30)

print("Numero de classes:"); Res$Num.Class
print("Nomes das classes:"); Res$Class.Names
print("Funcao indice de projecao:"); Res$Findex
print("Dados projetados:"); Res$Proj.Data
print("Vetores de projecao:"); Res$Vector.Opt
print("Indices de projecao:"); Res$Index



