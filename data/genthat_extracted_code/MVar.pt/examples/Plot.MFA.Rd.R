library(MVar.pt)


### Name: Plot.MFA
### Title: Graficos da analise de multiplos fatores (MFA).
### Aliases: Plot.MFA
### Keywords: Analise de multiplos fatores MFA MFACT

### ** Examples

data(DataMix) # conjunto de dados mistos

Data <- DataMix[,2:ncol(DataMix)] 

rownames(Data) <- DataMix[1:nrow(DataMix),1]

GroupNames = c("Notas Cafes/Trabalho", "Formacao/Dedicacao", "Cafes")
           
MF <- MFA(Data, c(2,2,2), TypeGroups = c("n","c","f"), GroupNames) # realiza MFA

Tit = c("Scree-plot","Observacoes","Observacoes/Variaveis","Inercias dos Grupos Variaveis")

Plot.MFA(MF, Titles = Tit, xlabel = NA, ylabel = NA,
         PosLeg = 2, BoxLeg = FALSE, Color = TRUE, 
         NamArr = FALSE, LinLab = NA, 
         Casc = FALSE) # Plota varios graficos da tela

Plot.MFA(MF, Titles = Tit, xlabel = NA, ylabel = NA,
         PosLeg = 2, BoxLeg = FALSE, Color = TRUE, 
         NamArr = FALSE, LinLab = rep("A?",10), 
         Casc = FALSE) # Plota varios graficos da tela



