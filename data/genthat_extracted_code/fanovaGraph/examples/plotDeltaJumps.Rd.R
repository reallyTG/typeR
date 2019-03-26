library(fanovaGraph)


### Name: plotDeltaJumps
### Title: Delta Jump Plot
### Aliases: plotDeltaJumps

### ** Examples

tii <- matrix(c(0.0018, 0.0265, 0.0017, 0.0277, 0.0018, 0.001, 0.028, 0.0013, 
  0.0212, 0.002, 0.0372, 0.0024, 0.0022, 0.0157, 0.003))
g <- list(d = 6, 
tii = tii,
i1 = matrix(c(0.0901, 0.1288, 0.0683, 0.0979, 0.0882, 0.1572)),
V = 0.8,
tii.scaled = tii/0.8,
cliques = list(1:6))

### Delta Jump Plot (jump between 0.0038 and 0.0196)
plotDeltaJumps(g)





