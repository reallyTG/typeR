library(MVar)


### Name: Regr
### Title: Linear regression.
### Aliases: Regr
### Keywords: Regression

### ** Examples

data(DataMix)

Y <- DataMix[,2]

X <- DataMix[,6:7]

NomeY <- "Medias notas"

NomeX <- c("Special Coffees", "Commercial Coffees")

Res <- Regr(Y, X, NameVarX = NomeX , Intercepts = TRUE, SigF = 0.05)

print("Regression Coefficients:"); round(Res$Betas,4)
print("Analysis of Variance:"); Res$ANOVA
print("Hypothesis test of regression coefficients:"); round(Res$Hip.Test,4)
print("Determination coefficient:"); round(Res$R,4)
print("Corrected coefficient of determination:"); round(Res$Rc,4) 
print("Adjusted coefficient of determination:"); round(Res$Ra,4)
print("Tests of the residues"); Res$Error.Test



