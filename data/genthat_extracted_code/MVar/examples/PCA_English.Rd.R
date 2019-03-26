library(MVar)


### Name: PCA
### Title: Principal Components Analysis (PCA).
### Aliases: PCA
### Keywords: Principal Components Analysis PCA

### ** Examples

data(DataQuan) # set of quantitative data

Data <- DataQuan[,2:8]

rownames(Data) <- DataQuan[1:nrow(DataQuan),1]

PC <- PCA(Data, 2) # performs the PCA

print("Covariance matrix / Correlation:"); round(PC$MatrixMC,2)

print("Principal Components:"); round(PC$MatrixAutoVec,2)

print("Principal Component Variances:"); round(PC$MatrixAutoVlr,2)

print("Covariance of the Principal Components:"); round(PC$MatrixVCP,2)

print("Correlation of the Principal Components:"); round(PC$MatrixCCP,2)

print("Scores of the Principal Components:"); round(PC$MatrixEsc,2)



