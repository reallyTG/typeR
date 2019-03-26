library(MVar.pt)


### Name: Data_Individuos
### Title: Conjunto de dados de frequencia.
### Aliases: Data_Individuos
### Keywords: Conjunto de dados

### ** Examples

data(Data_Individuos) # conjundo de dados categorizados

Data <- Data_Individuos[,2:ncol(Data_Individuos)]

rownames(Data) <- as.character(t(Data_Individuos[1:nrow(Data_Individuos),1]))

GroupNames = c("Grupo 1", "Grupo 2", "Grupo 3", "Grupo 4")

MF <- MFA(Data, c(16,16,16,16), c(rep("f",4)), GroupNames) # analise dos dados

print("Variancias dos Componentes Principais:"); round(MF$MatrixA,2)

print("Matriz das Inercias Parciais/Escores das Variaveis:"); round(MF$MatrixEscVar,2)

Tit = c("Scree-plot","Individuos", "Individuos/Grupos Individuos", "Inercias Grupos")

Plot.MFA(MF, Titles = Tit, xlabel = NA, ylabel = NA,
         PosLeg = 2, BoxLeg = FALSE, Color = TRUE, 
         NamArr = FALSE, LinLab = NA, Casc = FALSE) # Imprime varios graficos da tela



