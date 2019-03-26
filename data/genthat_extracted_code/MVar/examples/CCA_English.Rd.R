library(MVar)


### Name: CCA
### Title: Canonical Correlation Analysis(CCA).
### Aliases: CCA
### Keywords: Analysis of canonical correlation CCA

### ** Examples

data(DataMix) # data set

Data <- DataMix[,2:ncol(DataMix)]

rownames(Data) <- DataMix[,1]

X <- as.data.frame(NormData(Data[,1:2],2))

Y <- as.data.frame(NormData(Data[,5:6],2))

Resp <- CCA(X, Y, Type = 1, Test = "Bartlett", Sign = 0.05)

print("Matrix with eigenvalues (variances) of the canonical pairs U and V:"); round(Resp$Var.UV,3)

print("Matrix of the correlation of the canonical pairs U and V:"); round(Resp$Corr.UV,3)

print("Matrix of the canonical coefficients of the group X:"); round(Resp$Coef.X,3)

print("Matrix of the canonical coefficients of the group Y:"); round(Resp$Coef.Y,3)

print("Matrix of the correlations between the canonical 
       variables and the original variables of the group X:"); round(Resp$Coor.X,3)

print("Matrix of the correlations between the canonical 
       variables and the original variables of the group Y:"); round(Resp$Coor.Y,3)

print("Matrix with the scores of the group X:"); round(Resp$Score.X,3)

print("Matrix with the scores of the group Y:"); round(Resp$Score.Y,3)

print("Test of significance of the canonical pairs:"); Resp$SigTest



