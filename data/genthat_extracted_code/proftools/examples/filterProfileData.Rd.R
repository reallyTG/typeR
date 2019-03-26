library(proftools)


### Name: filterProfileData
### Title: Filter Profile Data
### Aliases: filterProfileData
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
plotProfileCallGraph(pd)
plotProfileCallGraph(filterProfileData(pd, self.pct = 1))
plotProfileCallGraph(filterProfileData(pd, self.pct = 1, total.pct = 10))
plotProfileCallGraph(filterProfileData(pd, select = "glm", self.pct=1,
                                       total.pct=10))



