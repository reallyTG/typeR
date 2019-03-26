library(VineCopula)


### Name: TauMatrix
### Title: Matrix of Empirical Kendall's Tau Values
### Aliases: TauMatrix

### ** Examples


data(daxreturns)
Data <- as.matrix(daxreturns)

# compute the empirical Kendall's taus
TauMatrix(Data)




