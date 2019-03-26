library(simsem)


### Name: estmodel
### Title: Shortcut for data analysis template for simulation.
### Aliases: estmodel estmodel.cfa estmodel.path estmodel.sem

### ** Examples

loading <- matrix(0, 12, 4)
loading[1:3, 1] <- NA
loading[4:6, 2] <- NA
loading[7:9, 3] <- NA
loading[10:12, 4] <- NA

CFA.Model <- estmodel(LY = loading, modelType = "CFA")

path <- matrix(0, 4, 4)
path[3, 1:2] <- NA
path[4, 3] <- NA
Path.Model <- estmodel(BE = path, modelType = "Path")

SEM.Model <- estmodel(BE = path, LY = loading, modelType="SEM")

# Shortcut
CFA.Model <- estmodel.cfa(LY = loading)
Path.Model <- estmodel.path(BE = path)
SEM.Model <- estmodel.sem(BE = path, LY = loading)



