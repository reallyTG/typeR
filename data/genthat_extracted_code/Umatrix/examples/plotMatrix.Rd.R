library(Umatrix)


### Name: plotMatrix
### Title: plotMatrix
### Aliases: plotMatrix

### ** Examples

data("Hepta")
e = esomTrain(Hepta$Data, Key = 1:nrow(Hepta$Data))
plotMatrix(e$Umatrix,e$BestMatches)



