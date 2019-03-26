library(Cubist)


### Name: exportCubistFiles
### Title: Export Cubist Information To the File System
### Aliases: exportCubistFiles
### Keywords: models

### ** Examples


library(mlbench)
data(BostonHousing)

mod1 <- cubist(x = BostonHousing[, -14], y = BostonHousing$medv)
exportCubistFiles(mod1, neighbors = 8, path = tempdir(), prefix = "BostonHousing")





