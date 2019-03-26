library(robCompositions)


### Name: ternaryDiagPoints
### Title: Add points or lines to a given ternary diagram.
### Aliases: ternaryDiagPoints ternaryDiagLines
### Keywords: aplot

### ** Examples


data(coffee)
x <- coffee[,2:4]
ternaryDiag(x, grid=FALSE)
ternaryDiagPoints(x+1, col="red", pch=2)




