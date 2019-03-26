library(proftools)


### Name: hotPaths
### Title: Hot Paths in Profile Data
### Aliases: hotPaths
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
hotPaths(pd)
hotPaths(pd, maxdepth = 8)



