library(ISAT)


### Name: procDist
### Title: Extract the statistics from the result given by findNNs
### Aliases: procDist

### ** Examples

Cell.X.Position=sample(1:1000, 20, replace=TRUE)
Cell.Y.Position=sample(1:1000, 20, replace=TRUE)
distance = runif(20,min=0,max=100)
distResult = data.frame (Cell.X.Position,Cell.Y.Position,distance)
thred=30
procDist(distResult,thred)



