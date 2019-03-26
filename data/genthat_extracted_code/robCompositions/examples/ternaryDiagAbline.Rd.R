library(robCompositions)


### Name: ternaryDiagAbline
### Title: Adds a line to a ternary diagram.
### Aliases: ternaryDiagAbline
### Keywords: aplot

### ** Examples


data(coffee)
x <- coffee[,2:4]
ternaryDiag(x, grid=FALSE)
ternaryDiagAbline(data.frame(z1=c(0.01,0.5), z2=c(0.4,0.8)), col="red")




