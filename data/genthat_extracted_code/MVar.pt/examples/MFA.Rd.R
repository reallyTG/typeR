library(MVar.pt)


### Name: MFA
### Title: Analise de multiplos fatores (MFA).
### Aliases: MFA
### Keywords: Analise de multiplos fatores MFA MFACT

### ** Examples

data(DataMix) # conjunto de dados mistos

Data <- DataMix[,2:ncol(DataMix)] 

rownames(Data) <- DataMix[1:nrow(DataMix),1]

GroupNames = c("Notas Cafes/Trabalho", "Formacao/Dedicacao", "Cafes")

MF <- MFA(Data, c(2,2,2), TypeGroups = c("n","c","f"), GroupNames) # realiza MFA

print("Variancias dos Componentes Principais:"); round(MF$MatrixA,2)

print("Matriz das Inercias Parciais/Escores das Variaveis:"); round(MF$MatrixEscVar,2)



