library(VineCopula)


### Name: as.copuladata
### Title: Copula Data Objects
### Aliases: as.copuladata as.copuladata.data.frame as.copuladata.matrix
###   as.copuladata.list

### ** Examples


data(daxreturns)

data <- as(daxreturns, "matrix")
class(as.copuladata(data))

data <- as(daxreturns, "data.frame")
class(as.copuladata(data))

data <- as(daxreturns, "list")
names(data) <- names(daxreturns)
class(as.copuladata(data))




