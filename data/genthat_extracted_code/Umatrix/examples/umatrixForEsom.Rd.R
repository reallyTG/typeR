library(Umatrix)


### Name: umatrixForEsom
### Title: umatrixForEsom
### Aliases: umatrixForEsom
### Keywords: Umatrix U-matrix U-Matrix

### ** Examples

data("Hepta")
e = esomTrain(Hepta$Data, Key = 1:nrow(Hepta$Data))
umatrix = umatrixForEsom(e$Weights,
                         Lines=e$Lines,
                         Columns=e$Columns,
                         Toroid=e$Toroid)
plotMatrix(umatrix,e$BestMatches)



