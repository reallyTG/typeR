library(Umatrix)


### Name: pmatrixForEsom
### Title: pmatrixForEsom
### Aliases: pmatrixForEsom
### Keywords: Pmatrix P-matrix P-Matrix

### ** Examples

data("Hepta")
e = esomTrain(Hepta$Data, Key = 1:nrow(Hepta$Data))
Pmatrix = pmatrixForEsom(Hepta$Data,
                         e$Weights,
                         e$Lines,
                         e$Columns,
                         e$Toroid)
plotMatrix(Pmatrix, ColorStyle = "Pmatrix")



