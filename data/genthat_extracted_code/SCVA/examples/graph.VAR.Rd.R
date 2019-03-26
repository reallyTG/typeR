library(SCVA)


### Name: graph.VAR
### Title: Plot an estimate of variability
### Aliases: graph.VAR
### Keywords: Single-case design Graph Variability Range lines Range bar
###   Trended range

### ** Examples

data(AB)
graph.VAR(design = "AB", VAR = "RB", CL = "mean", data = AB)
graph.VAR(design = "AB", VAR = "RL", data = AB)
graph.VAR(design = "AB", VAR = "TR", data = AB)
graph.VAR(design = "AB", VAR = "RL", dataset = "trimmed", data = AB)



