library(MFAg)


### Name: Plot.MFA
### Title: Graphics Multiple Factors Analysis (MFA)
### Aliases: Plot.MFA
### Keywords: Multiple Factors Analysis MFA MFACT

### ** Examples

data(DataMix) # set of mixed data of the cooperatives

Matriz = DataMix[,2:ncol(DataMix)] 

rownames(Matriz) <- as.character(t(DataMix[1:nrow(DataMix),1]))

GroupNames = c("Notes Coffee / Work","Training / Dedication","Coffee")
           
MF <- MFA(Matriz, c(2,2,2), TipoGrupo = c("n","c","f"), GroupNames) # performs MFA

Titulos = c("Cooperatives/Tasters", "Cooperatives/Tasters and Variables",
             "Inertia of the groups of variables")
                   
Plot.MFA(MF, Titulos, 2, "n", "s", "n") # several screen plots



