library(MVar.pt)


### Name: Data_Cafes
### Title: Conjunto de dados de frequencia.
### Aliases: Data_Cafes
### Keywords: Conjunto de dados

### ** Examples

data(Data_Cafes) # conjunto de dados categorizados

Data <- Data_Cafes[,2:ncol(Data_Cafes)] 

rownames(Data) <- as.character(t(Data_Cafes[1:nrow(Data_Cafes),1]))

GroupNames = c("Cafe A", "Cafe B", "Cafe C", "Cafe D")

MF <- MFA(Data, c(16,16,16,16), c(rep("f",4)), GroupNames) 

print("Variancias dos Componentes Principais:"); round(MF$MatrixA,2)

print("Matriz das Inercias Parciais/Escores das Variaveis:"); round(MF$MatrixEscVar,2)

Tit = c("Scree-plot","Individuos", "Individuos/Tipos Cafes", "Inercias Grupos")

Plot.MFA(MF, Titles = Tit, xlabel = NA, ylabel = NA,
         PosLeg = 2, BoxLeg = FALSE, Color = TRUE, 
         NamArr = FALSE, LinLab = NA, Casc = FALSE) # Imprime varios graficos da tela




