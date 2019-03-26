library(Umatrix)


### Name: ustarmatrixCalc
### Title: ustarmatrixCalc
### Aliases: ustarmatrixCalc
### Keywords: U*matrix U*-matrix U*-Matrix Ustarmatrix Ustar-matrix
###   Ustar-Matrix

### ** Examples

data("Hepta")
e = esomTrain(Hepta$Data, Key = 1:nrow(Hepta$Data))
Pmatrix = pmatrixForEsom(Hepta$Data,
                         e$Weights,
                         e$Lines,
                         e$Columns,
                          e$Toroid)
Ustarmatrix = ustarmatrixCalc(e$Umatrix, Pmatrix)
plotMatrix(Ustarmatrix, e$BestMatches)



