library(proftools)


### Name: callTreeGraphs
### Title: Call Tree Graphs
### Aliases: flameGraph calleeTreeMap identify.proftools_calleeTreeMap
###   identify.proftools_flameGraph
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
flameGraph(pd)
calleeTreeMap(pd)



