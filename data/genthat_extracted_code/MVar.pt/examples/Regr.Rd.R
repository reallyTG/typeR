library(MVar.pt)


### Name: Regr
### Title: Regressao linear.
### Aliases: Regr
### Keywords: Regressao

### ** Examples

data(DataMix)

Y <- DataMix[,2]

X <- DataMix[,6:7]

NomeY <- "Medias notas"

NomeX <- c("Cafes Expeciais","Cafes Comerciais")

Res <- Regr(Y, X, NameVarX = NomeX , Intercepts = TRUE, SigF = 0.05)

print("Coeficientes da Regressao:"); round(Res$Betas,4)
print("Analise de Variancia:"); Res$ANOVA
print("Teste de Hipoteses dos Coeficientes da Regressao:"); round(Res$Hip.Test,4)
print("Coeficiente de Determinacao:"); round(Res$R,4)
print("Coeficiente de Determinacao Corrigido:"); round(Res$Rc,4) 
print("Coeficiente de Determinacao Ajustado:"); round(Res$Ra,4)
print("Testes dos Residuos:"); Res$Error.Test



