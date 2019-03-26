library(robCompositions)


### Name: ternaryDiagEllipse
### Title: Adds tolerance ellipses to a ternary diagram.
### Aliases: ternaryDiagEllipse
### Keywords: aplot

### ** Examples


data(coffee)
x <- coffee[,2:4]
ternaryDiag(x, grid=FALSE)
ternaryDiagEllipse(x)
## or directly:
ternaryDiag(x, grid=FALSE, line="ellipse")




