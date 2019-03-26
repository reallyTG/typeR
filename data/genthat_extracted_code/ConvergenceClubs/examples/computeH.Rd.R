library(ConvergenceClubs)


### Name: computeH
### Title: Compute H values
### Aliases: computeH

### ** Examples

data("filteredGDP")

h <- computeH(filteredGDP[,-1], quantity="h")
H <- computeH(filteredGDP[,-1], quantity="H")
b <- computeH(filteredGDP[,-1], quantity="both")





