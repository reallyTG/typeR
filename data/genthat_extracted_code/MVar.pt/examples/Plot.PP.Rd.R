library(MVar.pt)


### Name: Plot.PP
### Title: Graficos da projection pursuit (PP).
### Aliases: Plot.PP
### Keywords: Projection pursuit PP

### ** Examples

data(iris) # conjunto de dados

# Exemplo 1 - Sem as classes nos dados
Data <- iris[,1:4]

FcIndex <- "kurtosismax" # funcao indice

Dim <- 1 # dimensao da projecao dos dados

Sphere <- TRUE # dados esfericos

Res <- PP_Optimizer(Data = Data, Class = NA, Findex = FcIndex,
                    OptMethod = "GTSA", DimProj = Dim, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 500, Half = 30)
 
Plot.PP(Res, Titles = NA, PosLeg = 1, BoxLeg = FALSE, Color = TRUE,
        Label = FALSE, LinLab = NA, AxisVar = TRUE, Axis = TRUE, 
        Casc = FALSE)


# Exemplo 2 - Com as classes nos dados
Class <- iris[,5] # classe dos dados

Res <- PP_Optimizer(Data = Data, Class = Class, Findex = FcIndex,
                    OptMethod = "GTSA", DimProj = Dim, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 500, Half = 30)

Tit <- c(NA,"Exemplo de grafico") # titulos para os graficos

Plot.PP(Res, Titles = Tit, PosLeg = 1, BoxLeg = FALSE, Color = TRUE,
        Label = FALSE, LinLab = Class, AxisVar = TRUE, Axis = TRUE,
        Casc = FALSE)


# Exemplo 3 - Sem as classes nos dados, mas informando 
#             as classes na funcao plot
Res <- PP_Optimizer(Data = Data, Class = NA, Findex = "Moment",
                    OptMethod = "GTSA", DimProj = 2, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 500, Half = 30)

Class <- c(rep("a",50),rep("b",50),rep("c",50)) # classe dos dados

Plot.PP(Res, Titles = NA, PosLeg = 1, BoxLeg = FALSE, Color = TRUE,
        Label = FALSE, LinLab = Class, AxisVar = TRUE, Axis = TRUE,
        Casc = FALSE)


# Exemplo 4 - Com as classes nos dados, mas nao informada na funcao plot
Class <- iris[,5] # classe dos dados

Dim <- 2 # dimensao da projecao dos dados

FcIndex <- "lda" # funcao indice

Res <- PP_Optimizer(Data = Data, Class = Class, Findex = FcIndex,
                    OptMethod = "GTSA", DimProj = Dim, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 500, Half = 30)

Tit <- c("",NA) # titulos para os graficos

Plot.PP(Res, Titles = Tit, PosLeg = 1, BoxLeg = FALSE, Color = TRUE,
        Label = FALSE, LinLab = NA, AxisVar = TRUE, Axis = TRUE,
        Casc = FALSE)



