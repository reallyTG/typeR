library(VisuClust)


### Name: FuzzyPlot
### Title: Displays a Fuzzy Plot
### Aliases: FuzzyPlot

### ** Examples


library(cluster)
library(MASS)

# The example data
data("MilchSmall")

M <- scale(MilchSmall[3:6])
D <- dist(M)
S <- sammon(D)
F <- fanny(D, 6)

FuzzyPlot(S$points, F$membership, labels=MilchSmall[,2], 
	clusterColors=c("red", "green", "magenta", "yellow", "blue", "black"))





