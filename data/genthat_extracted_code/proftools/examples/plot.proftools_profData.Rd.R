library(proftools)


### Name: plot.proftools_profData
### Title: Plot Profile Data
### Aliases: plot.proftools_profData
### Keywords: hplot ts

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
plot(pd)
plot(pd, style = plain.style)
plot(pd, type = "call")
plot(pd, type = "flame")



