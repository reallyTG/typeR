library(proftools)


### Name: plotProfileCallGraph
### Title: Plot Call Graph for Rprof Profile Data
### Aliases: plotProfileCallGraph
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
plotProfileCallGraph(pd)
plotProfileCallGraph(pd, score = "none")
plotProfileCallGraph(pd, style = plain.style, score = "total")



