library(proftools)


### Name: rgl-package
### Title: Tools for examining R profile output
### Aliases: proftools-package proftools
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
funSummary(pd)
callSummary(pd)
pathSummary(pd)
hotPaths(pd)
plot(pd)
plot(filterProfileData(pd, focus = "glm", self.pct=1, total.pct=10))



