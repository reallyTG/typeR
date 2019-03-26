library(MVar)


### Name: FA
### Title: Factor Analysis (FA).
### Aliases: FA
### Keywords: Factor Analysis FA

### ** Examples

data(DataQuan) # data set

Data <- DataQuan[,2:ncol(DataQuan)]

rownames(Data) <- DataQuan[,1]

Resp <- FA(Data, Method = "PC", Type = 2, NFactor = 3, Rotation = "None",
           ScoresObs = "Bartlett", Converg = 1e-5, Iteracao = 1000, 
           TestFit = TRUE) 

print("Matrix with all associated results:"); round(Resp$MatrixResult,3)

print("Sum of squares of the residues:"); round(Resp$VlrSQR,3)

print("Matrix of the factor loadings.:"); round(Resp$MatrixCarga,3)

print("Matrix with scores of the observations:"); round(Resp$MatrixScores,3)

print("Matrix with the scores of the coefficients of the factors:"); round(Resp$CoefScores,3)




